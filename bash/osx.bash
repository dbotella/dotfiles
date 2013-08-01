# -----------------------------------------------------------------------------
# ~zozo/.config/bash/osx                          executed if $OSTYPE = darwin*
# say hello: printf "zozo\x40inescapable\x2eorg"
# -----------------------------------------------------------------------------

[[ $OSTYPE =~ darwin ]] || {
    printf "%s: Cannot source on this OS\n" "$(basename ${BASH_SOURCE[0]} .sh)" 1>&2
    return 1
}

# -----------------------------------------------------------------------------

# hardware identifier
hardware=$(sysctl -n hw.model)

# WiFi card
netcard=$(echo list | scutil | grep -m 1 AirPort | grep -o 'en[0-9]')

# WiFi network
airportUtility='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
network="$($airportUtility -I | egrep '\<SSID' | sed -E 's/^ +SSID: //g')"

# compiler flags
export ARCHFLAGS="-arch $(sysctl -n hw.machine)"

# -----------------------------------------------------------------------------
# Terminal.app
# -----------------------------------------------------------------------------

# tell the terminal about the working directory at each prompt.
[[ $TERM_PROGRAM == "Apple_Terminal" ]] && {
    [[ $TMUX ]] && { # ANSI device control string
        tmuxEscAnte="\ePtmux;\e"
        tmuxEscPost="\e\\"
    }

    update_terminal_cwd()
    {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.

        declare SEARCH=' '
        declare REPLACE='%20'
        declare PWD_URL="file://${HOSTNAME}${PWD//$SEARCH/$REPLACE}"

        declare escAnte="\e]2;"

        printf '%b\e]7;%b\a%b' "$tmuxEscAnte" "$PWD_URL" "$tmuxEscPost"
    }

    addPromptCmd update_terminal_cwd
}

# -----------------------------------------------------------------------------
# Networking &c.
# -----------------------------------------------------------------------------

# toggle Bluetooth (http://frederikseiffert.de/blueutil)
alias btoff="blueutil off"
alias bton="blueutil on"

# toggle WiFi
alias wifioff="networksetup -setairportpower $netcard off"
alias wifion="networksetup -setairportpower $netcard on"

# number of users connected to AirPort (vars set in private.bash)
alias aeusers="snmpget -v 2c -c $snmp_community -M $snmp_mibPath -m+${snmp_mib} \
    ${snmp_host}.local ${snmp_mib}::wirelessNumber.0 | \
    grep -o --color=never '[[:digit:]+]$'"

# local IP address
alias localip="ipconfig getifaddr $netcard"

# IP address of router
alias router="netstat -rn | grep default | awk '{print \$2}'"

# MAC address of WiFi card
alias getmac="ifconfig en1 | grep ether | awk '{print \$2}'"

# AirPort utilities
alias airport="$airportUtility"

# flush DNS cache
alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder 2>/dev/null"

# share $PWD at localhost:7777
alias webshare="python -m SimpleHTTPServer 7777"

# Back to My Mac IPv6 address
bttm=$(echo show Setup:/Network/BackToMyMac | scutil | sed -n 's/.* : *\(.*\).$/\1/p')

# screen sharing
alias ssm='open "vnc://Minerva.$bttm"'
alias sse='open "vnc://Erato.$bttm"'

# -----------------------------------------------------------------------------
# System &c.
# -----------------------------------------------------------------------------

alias lockscreen='"/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession" -suspend'
alias gotosleep="pmset sleepnow"
alias restart="sudo shutdown -r now"
alias screensaver='open "/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"'

# load Windows on next boot
alias bootwin='sudo bless -mount "/Volumes/BOOTCAMP" -legacy -setBoot -nextonly'
# ...or right now
alias bootcamp="bootwin && restart"

# sound
alias mute='osascript -e "set volume output muted true"'
alias unmute='osascript -e "set volume output muted false"'

# quarantine
alias qudisable='defaults write com.apple.LaunchServices LSQuarantine -bool NO && echo "Restart for setting to take effect"'
alias quenable='defaults delete com.apple.LaunchServices LSQuarantine && echo "Restart for setting to take effect"'
alias unquar="xattr -d -r com.apple.quarantine" # recurses into directories

# -----------------------------------------------------------------------------
# Misc. shortcuts
# -----------------------------------------------------------------------------

alias emptytrash="sudo rm -rf /Volumes/*/.Trashes/*; sudo rm -rf ~/.Trash/*"
alias plist2bin="plutil -convert binary1"
alias plist2xml="plutil -convert xml1"
alias reveal="open -R" # show $1 in Finder

# change file flags
alias hide="chflags hidden"
alias unhide="chflags nohidden"
alias lockfile="sudo chflags uchg"
alias unlockfile="sudo chflags nouchg"

# copy $PWD to clipboard
alias cppwd='printf $PWD | pbcopy'

# interpret $1 as though it had been typed into the Spotlight menu
alias spliteral="mdfind -interpret"

# http://localhost/cgi-bin/
alias cgibin="cd /Library/WebServer/CGI-Executables/"

alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister \
    -kill -r -domain local -domain system -domain user"

# -----------------------------------------------------------------------------
# MacPorts/Homebrew
# -----------------------------------------------------------------------------

if [[ -e /opt/local/bin/port ]]; then
    alias psearch='port search'
    alias pinfo='port info'
    alias pi='sudo port install'
    alias pui='sudo port uninstall'
    alias pfiles='port contents'
    alias portupdate='sudo port selfupdate && sudo port upgrade outdated'
fi

if [[ -e /usr/local/bin/brew ]]; then
    alias b='brew'
    alias brewupdate='brew update && brew upgrade'
fi