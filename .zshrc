# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="dbotella-agnoster"
# ZSH_THEME="minimal-dbotella"
# ZSH_THEME="nicoulaj"
# ZSH_THEME="apple"
# ZSH_THEME="kiwi"
# ZSH_THEME="random"
# ZSH_THEME="frisk"
ZSH_THEME="obraun"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(battery command-not-found tmux
atom brew brew-cask cake colorize common-aliases git history mvn osx perl screen sublime sudo)



if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

# User configuration
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:$PATH

if [[ $(uname) == "Darwin" ]]; then export OSX=1; fi
if [[ $(uname) ==  "Linux" ]]; then export LINUX=1; fi


if [[ -n $OSX ]]; then
        export JAVA_HOME=$(/usr/libexec/java_home)
else
        export JAVA_HOME=/usr/lib/jvm/default-java
fi

export COV_ANALYSIS_TOOLS=/Users/dbotella/Applications/cov-analysis
export PERLBREW_HOME=~/perl5/perlbrew

source ~/perl5/perlbrew/etc/bashrc
# export JAVA_HOME=$(/usr/libexec/java_home)
export MAVEN_HOME=/usr/local/Cellar/maven/3.3.3
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export PATH=$PATH:$HOME/bin:/usr/local/bin:/usr/local/opt/perl/bin:$COV_ANALYSIS_TOOLS/bin:$JAVA_HOME/bin:$GROOVY_HOME/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# JENV Specific
eval "$(jenv init -)"

# To enable shims and autocompletion add to your profile:
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# To use Homebrew's directories rather than ~/.jenv add to your profile:
export JENV_ROOT=/usr/local/opt/jenv

export MONO_GAC_PREFIX="/usr/local"

LDFLAGS="-L/usr/local/opt/gettext/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/gettext/include $CPPFLAGS"
LDFLAGS="-L/usr/local/opt/libffi/lib $LDFLAGS"
LDFLAGS="-L/usr/local/opt/bison/lib $LDFLAGS"
LDFLAGS="-L/usr/local/opt/curl/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/curl/include $CPPFLAGS"
LDFLAGS="-L/usr/local/opt/openssl/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/openssl/include $CPPFLAGS"
LDFLAGS="-L/usr/local/opt/readline/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/readline/include $CPPFLAGS"
LDFLAGS="-L/usr/local/opt/icu4c/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/icu4c/include $CPPFLAGS"
LDFLAGS="-L/usr/local/opt/iojs/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/iojs/include $CPPFLAGS"
LDFLAGS="-L/usr/local/opt/libressl/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/libressl/include $CPPFLAGS"
LDFLAGS="-L/usr/local/opt/libxml2/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/libxml2/include $CPPFLAGS"
LDFLAGS="-L/usr/local/opt/perl/lib $LDFLAGS"
LDFLAGS="-L/usr/local/opt/sqlite/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/sqlite/include $CPPFLAGS"
LDFLAGS="-L/usr/local/opt/berkeley-db/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/berkeley-db/include $CPPFLAGS"


# Maven in color !


typeset -Ag FX FG BG

FX=(
    reset     "[00m"
    bold      "[01m" no-bold      "[22m"
    italic    "[03m" no-italic    "[23m"
    underline "[04m" no-underline "[24m"
    blink     "[05m" no-blink     "[25m"
    reverse   "[07m" no-reverse   "[27m"
)

local SUPPORT

# Optionally handle impoverished terminals.
if (( $# == 0 )); then
    SUPPORT=256
else
    SUPPORT=$1
fi

# Fill the color maps.
for color in {000..$SUPPORT}; do
    FG[$color]="[38;5;${color}m"
    BG[$color]="[48;5;${color}m"
done

#for code in {000..255}; do
#    print -P -- "$code: $FG[$code]≈}Test%f"
#done

autoload colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval FG_$COLOR='$fg_no_bold[${(L)COLOR}]'
    eval BG_$COLOR='$bg_no_bold[${(L)COLOR}]'
    eval BOLD_$COLOR='$fg_bold[${(L)COLOR}]'
done


c_bold=`tput setaf 0`
c_bg_bold=`tput setab 0`
c_black=${FG_BLACK}
c_bg_black=${BG_BLACK}
c_cyan=${FG_CYAN}
c_bg_cyan=${BG_CYAN}
c_magenta=${FG_MAGENTA}
c_bg_magenta=${BG_MAGENTA}
c_red=${FG_RED}
c_bg_red=${BG_RED}
c_white=${FG_WHITE}
c_bg_white=${BG_WHITE}
c_green=${FG_GREEN}
c_bg_green=${BG_GREEN}
c_yellow=${FG_YELLOW}
c_bg_yellow=${BG_YELLOW}
c_blue=${FG_BLUE}
c_bg_blue=${BG_BLUE}
c_end=`tput sgr0`



color_maven() {

 error=${c_bold}${c_red}
 info=${c_white}
 warn=${c_yellow}
 success=${c_green}
 projectname=${c_bold}${c_cyan}
 skipped=${c_white}
 downloading=${c_magenta}

 mvn $* | sed -E -e "s/(\[INFO\] )(Building .*)/${info}\1${projectname}\2${c_end}/g" \
                    -e "s/(Time elapsed: )([0-9]+[.]*[0-9]*.sec)/${defaulttext}\1${c_cyan}\2${c_end}/g" \
                    -e "s/(Downloading: .*)/${downloading}\1${c_end}/g" \
                    -e "s/(\[INFO\])(.* Successfully .*)/${info}\1${success}\2${c_end}/g" \
                    -e "s/(\[INFO\])(.* Attempting .*)/${info}\1${warn}\2${c_end}/g" \
                    -e "s/(\[INFO\])(.* Warning:)(.*)/${info}\1${warn}\2${defaulttext}\3${c_end}/g" \
                    -e "s/(\[INFO\])(.* Note:)(.*)/${info}\1${debug}\2${defaulttext}\3${c_end}/g" \
                    -e "s/(\[INFO\].*)(Installing )(.*)( to )(.*)/${defaulttext}\1${c_blue}\2${defaulttext}\3${c_blue}\4${defaulttext}\5${c_end}/g" \
                    -e "s/(BUILD SUCCESS.*)/${success}\1${c_end}/g" \
                    -e "s/BUILD FAILURE/${error}BUILD FAILURE${c_end}/g" \
                    -e "s/WARNING: (\([a-zA-Z0-9./\\ :-]\+\))/${warn}WARNING: \1${c_end}/g" \
                    -e "s/SEVERE: (.+)/${c_white}${c_bg_red}SEVERE: \1${c_end}/g" \
                    -e "s/Caused by: (.+)/${c_white}${c_bg_green}Caused by: \1${c_end}/g" \
                    -e "s/Running (.+)/${c_cyan}Running \1${c_end}/g" \
                    -e "s/SUCCESS (\[[0-9.:]+s\])/${success}SUCCESS \1${c_end}/g" \
                    -e "s/FAILURE (\[[0-9.:]+s\])/${error}FAILURE \1${c_end}/g" \
                    -e "s/SKIPPED/${skipped}SKIPPED${c_end}/g" \
                    -e "s/(--- android-maven-plugin.*)/${separator}\1${c_end}/g" \
                    -e "s/(--- maven.*)/${separator}\1${c_end}/g" \
                    -e "s/(\[INFO.*)/${info}\1${c_end}/g" \
                    -e "s/(\[DEBUG.*)/${debug}\1${c_end}/g" \
                    -e "s/INFO: (.+)/${info}INFO: \1${c_end}/g" \
                    -e "s/(Error: No resource found that matches the given name)/${errorhighlight}\1${info}/g" \
                    -e "s/(\[WARN.*)/${warn}\1${c_end}/g" \
                    -e "s/(\[ERROR.*)/${error}\1${c_end}/g" \
                    -e "s/(DISABLED)/${c_red}\1${c_end}/g" \
                    -e "s/(\[ERROR.*)(on project.*: )(.*)(-> \[Help 1\])/${error}\1${error}\2${errorhighlight}\3${error}\4${c_end}/g" \
                    -e "s/(No online devices attached.)/${errorhighlight}\1${c_red}/g" \
                    -e "s/(Unable to run launcher Activity)/${errorhighlight}\1${c_red}/g" \
                    -e "s/(No such file or directory)/${errorhighlight}\1${c_red}/g" \
                    -e "s/(No plugin found for prefix 'android' in the current project and in the plugin groups)/${errorhighlight}\1${c_red}/g" \
                    -e "s/(There are test failures.)/${errorhighlight}\1${c_red}/g" \
                    -e "s/(<<< FAILURE!)/${error}\1${c_end}/g" \
                    -e "s/(Building jar: )(.*)/${c_bg_black}${success}\1${c_yellow}\2${c_end}/g" \
                    -e "s/(Add native libraries from )(.*)/${success}\1${c_yellow}\2${c_end}/g" \
                    -e "s/(Manifest merging disabled. Using project manifest only)/${success}\1${c_end}/g" \
                    -e "s/(Enabling )(.*)( for apk.)/${success}\1${c_yellow}\2${success}\3${c_end}/g" \
                    -e "s/(Picked up _JAVA_OPTIONS: )(.*)/${c_green}\1${c_yellow}\2${c_end}/g" \
                    -e "s/(\[INFO\].*\.\.SUCCESS.*)/${success}\1${c_end}/g" \
                    -e "s/(\[INFO\].*Passed: )([0-9]*)(.*Failed: )([0-9]*)(.*Errors: )([0-9]*)(.*Skipped: )([0-9]*)/${defaulttext}\1${success}\2${defaulttext}\3${warn}\4${defaulttext}\5${error}\6${defaulttext}\7${skipped}\8${defaulttext}/g" \
                    -e "s/^(Tests run: )([0-9]*)(.*Failures: )([0-9]*)(.*Errors: )([0-9]*)(.*Skipped: )([0-9]*)/${defaulttext}\1${success}\2${defaulttext}\3${warn}\4${defaulttext}\5${error}\6${defaulttext}\7${skipped}\8${defaulttext}/g" \

}

alias mvn=color_maven


source $ZSH/oh-my-zsh.sh

#
# K better than ls
#

zmodload zsh/datetime
zmodload -F zsh/stat b:zstat

k () {
  # ----------------------------------------------------------------------------
  # Setup
  # ----------------------------------------------------------------------------

  # Stop stat failing when a directory contains either no files or no hidden files
  # Track if we _accidentally_ create a new global variable
  setopt local_options null_glob typeset_silent no_auto_pushd

  # Process options and get files/directories
  typeset -a o_all o_almost_all o_human o_si o_directory o_no_directory o_no_vcs o_help
  zparseopts -E -D \
             a=o_all -all=o_all \
             A=o_almost_all -almost-all=o_almost_all \
             d=o_directory -directory=o_directory \
             h=o_human -human=o_human \
             -si=o_si \
             n=o_no_directory -no-directory=o_no_directory \
             -no-vcs=o_no_vcs \
             -help=o_help

  # Print Help if bad usage, or they asked for it
  if [[ $? != 0 || "$o_help" != "" ]]
  then
    print -u2 "Usage: k [options] DIR"
    print -u2 "Options:"
    print -u2 "\t-a      --all           list entries starting with ."
    print -u2 "\t-A      --almost-all    list all except . and .."
    print -u2 "\t-d      --directory     list only directories"
    print -u2 "\t-n      --no-directory  do not list directories"
    print -u2 "\t-h      --human         show filesizes in human-readable format"
    print -u2 "\t        --si            with -h, use powers of 1000 not 1024"
    print -u2 "\t        --no-vcs        do not get VCS status (much faster)"
    print -u2 "\t        --help          show this help"
    return 1
  fi

  # Check for conflicts
  if [[ "$o_directory" != "" && "$o_no_directory" != "" ]]; then
    print -u2 "$o_directory and $o_no_directory cannot be used together"
    return 1
  fi

  # Check which numfmt available (if any), warn user if not available
  typeset -i numfmt_available=0
  typeset -i gnumfmt_available=0
  if [[ "$o_human" != "" ]]; then
    if [[ $+commands[numfmt] == 1 ]]; then
      numfmt_available=1
    elif [[ $+commands[gnumfmt] == 1 ]]; then
      gnumfmt_available=1
    else
      print -u2 "'numfmt' or 'gnumfmt' command not found, human readable output will not work."
      print -u2 "\tFalling back to normal file size output"
      # Set o_human to off
      o_human=""
    fi
  fi

  # Create numfmt local function
  numfmt_local () {
    if [[ "$o_si" != "" ]]; then
      if (( $numfmt_available )); then
        numfmt --to=si $1
      elif (( $gnumfmt_available )); then
        gnumfmt --to=si $1
      fi
    else
      if (( $numfmt_available )); then
        numfmt --to=iec $1
      elif (( $gnumfmt_available )); then
        gnumfmt --to=iec $1
      fi
    fi
  }

  # Set if we're in a repo or not
  typeset -i INSIDE_WORK_TREE=0
  if [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]; then
    INSIDE_WORK_TREE=1
  fi

  # Setup array of directories to print
  typeset -a base_dirs

  if [[ "$@" == "" ]]; then
    base_dirs=.
  else
    base_dirs=($@)
  fi

  # ----------------------------------------------------------------------------
  # Loop over passed directories and files to display
  # ----------------------------------------------------------------------------
  for base_dir in $base_dirs
  do
    # ----------------------------------------------------------------------------
    # Display name if multiple paths were passed
    # ----------------------------------------------------------------------------
    if [[ "$#base_dirs" > 1 ]]; then
      # Only add a newline if its not the first iteration
      if [[ "$base_dir" != "${base_dirs[1]}" ]]; then
        print
      fi
      print -r "${base_dir}:"
    fi
    # ----------------------------------------------------------------------------
    # Vars
    # ----------------------------------------------------------------------------

    typeset -a MAX_LEN A RESULTS STAT_RESULTS
    typeset TOTAL_BLOCKS

    # Get now
    typeset K_EPOCH="${EPOCHSECONDS:?}"

    typeset -i TOTAL_BLOCKS=0

    MAX_LEN=(0 0 0 0 0 0)

    # Array to hold results from `stat` call
    RESULTS=()

    # only set once per directory so must be out of the main loop
    typeset -i IS_GIT_REPO=0
    typeset GIT_TOPLEVEL

    typeset -i LARGE_FILE_COLOR=196
    typeset -a SIZELIMITS_TO_COLOR
    SIZELIMITS_TO_COLOR=(
        1024  46    # <= 1kb
        2048  82    # <= 2kb
        3072  118   # <= 3kb
        5120  154   # <= 5kb
       10240  190   # <= 10kb
       20480  226   # <= 20kb
       40960  220   # <= 40kb
      102400  214   # <= 100kb
      262144  208   # <= 0.25mb || 256kb
      524288  202   # <= 0.5mb || 512kb
      )
    typeset -i ANCIENT_TIME_COLOR=236  # > more than 2 years old
    typeset -a FILEAGES_TO_COLOR
    FILEAGES_TO_COLOR=(
             0 196  # < in the future, #spooky
            60 255  # < less than a min old
          3600 252  # < less than an hour old
         86400 250  # < less than 1 day old
        604800 244  # < less than 1 week old
       2419200 244  # < less than 28 days (4 weeks) old
      15724800 242  # < less than 26 weeks (6 months) old
      31449600 240  # < less than 1 year old
      62899200 238  # < less than 2 years old
      )

    # ----------------------------------------------------------------------------
    # Build up list of files/directories to show
    # ----------------------------------------------------------------------------

    typeset -a show_list
    show_list=()

    # Check if it even exists
    if [[ ! -e $base_dir ]]; then
      print -u2 "k: cannot access $base_dir: No such file or directory"

    # If its just a file, skip the directory handling
    elif [[ -f $base_dir ]]; then
      show_list=($base_dir)

    #Directory, add its contents
    else
      # Break total blocks of the front of the stat call, then push the rest to results
      if [[ "$o_all" != "" && "$o_almost_all" == "" && "$o_no_directory" == "" ]]; then
        show_list+=($base_dir/.)
        show_list+=($base_dir/..)
      fi

      if [[ "$o_all" != "" || "$o_almost_all" != "" ]]; then
        if [[ "$o_directory" != "" ]]; then
          show_list+=($base_dir/*(D/))
        elif [[ "$o_no_directory" != "" ]]; then
          #Use (^/) instead of (.) so sockets and symlinks get displayed
          show_list+=($base_dir/*(D^/))
        else
          show_list+=($base_dir/*(D))
        fi
      else
        if [[ "$o_directory" != "" ]]; then
          show_list+=($base_dir/*(/))
        elif [[ "$o_no_directory" != "" ]]; then
          #Use (^/) instead of (.) so sockets and symlinks get displayed
          show_list+=($base_dir/*(^/))
        else
          show_list+=($base_dir/*)
        fi
      fi
    fi

    # ----------------------------------------------------------------------------
    # Stat call to get directory listing
    # ----------------------------------------------------------------------------
    typeset -i i=1 j=1 k=1
    typeset -a STATS_PARAMS_LIST
    typeset fn statvar h
    typeset -A sv

    STATS_PARAMS_LIST=()
    for fn in $show_list
    do
      statvar="stats_$i"
      typeset -A $statvar
      zstat -H $statvar -Lsn -F "%s^%d^%b^%H:%M^%Y" -- "$fn"  # use lstat, render mode/uid/gid to strings
      STATS_PARAMS_LIST+=($statvar)
      i+=1
    done


    # On each result calculate padding by getting max length on each array member
    for statvar in "${STATS_PARAMS_LIST[@]}"
    do
      sv=("${(@Pkv)statvar}")
      if [[ ${#sv[mode]}  -gt $MAX_LEN[1] ]]; then MAX_LEN[1]=${#sv[mode]}  ; fi
      if [[ ${#sv[nlink]} -gt $MAX_LEN[2] ]]; then MAX_LEN[2]=${#sv[nlink]} ; fi
      if [[ ${#sv[uid]}   -gt $MAX_LEN[3] ]]; then MAX_LEN[3]=${#sv[uid]}   ; fi
      if [[ ${#sv[gid]}   -gt $MAX_LEN[4] ]]; then MAX_LEN[4]=${#sv[gid]}   ; fi

      if [[ "$o_human" != "" ]]; then
        h=$(numfmt_local ${sv[size]})
        if (( ${#h} > $MAX_LEN[5] )); then MAX_LEN[5]=${#h}; fi
      else
        if [[ ${#sv[size]} -gt $MAX_LEN[5] ]]; then MAX_LEN[5]=${#sv[size]}; fi
      fi

      TOTAL_BLOCKS+=$sv[blocks]
    done

    # Print total block before listing
    echo "total $TOTAL_BLOCKS"

    # ----------------------------------------------------------------------------
    # Loop through each line of stat, pad where appropriate and do git dirty checking
    # ----------------------------------------------------------------------------

    typeset REPOMARKER
    typeset PERMISSIONS HARDLINKCOUNT OWNER GROUP FILESIZE FILESIZE_OUT DATE NAME SYMLINK_TARGET
    typeset FILETYPE PER1 PER2 PER3 PERMISSIONS_OUTPUT STATUS
    typeset TIME_DIFF TIME_COLOR DATE_OUTPUT
    typeset -i IS_DIRECTORY IS_SYMLINK IS_EXECUTABLE
    typeset -i COLOR

    k=1
    for statvar in "${STATS_PARAMS_LIST[@]}"
    do
      sv=("${(@Pkv)statvar}")

      # We check if the result is a git repo later, so set a blank marker indication the result is not a git repo
      REPOMARKER=" "
      IS_DIRECTORY=0
      IS_SYMLINK=0
      IS_EXECUTABLE=0

         PERMISSIONS="${sv[mode]}"
       HARDLINKCOUNT="${sv[nlink]}"
               OWNER="${sv[uid]}"
               GROUP="${sv[gid]}"
            FILESIZE="${sv[size]}"
                DATE=(${(s:^:)sv[mtime]}) # Split date on ^
                NAME="${sv[name]}"
      SYMLINK_TARGET="${sv[link]}"

      # Check for file types
      if [[ -d "$NAME" ]]; then IS_DIRECTORY=1; fi
      if [[ -L "$NAME" ]]; then   IS_SYMLINK=1; fi

      # IS_GIT_REPO is a 1 if $NAME is a file/directory in a git repo, OR if $NAME is a git-repo itself
      # GIT_TOPLEVEL is set to the directory containing the .git folder of a git-repo

      # is this a git repo
      if [[ "$o_no_vcs" != "" ]]; then
        IS_GIT_REPO=0
        GIT_TOPLEVEL=''
      else
        if (( IS_DIRECTORY ));
          then cd -q $NAME     2>/dev/null || cd -q - >/dev/null && IS_GIT_REPO=0 #Say no if we don't have permissions there
          else cd -q $NAME:a:h 2>/dev/null || cd -q - >/dev/null && IS_GIT_REPO=0
        fi
        if [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]; then
          IS_GIT_REPO=1
          GIT_TOPLEVEL=$(command git rev-parse --show-toplevel)
        else
          IS_GIT_REPO=0
        fi
        cd -q - >/dev/null
      fi

      # Get human readable output if necessary
      if [[ "$o_human" != "" ]]; then
        # I hate making this call twice, but its either that, or do a bunch
        # of calculations much earlier.
        FILESIZE_OUT=$(numfmt_local $FILESIZE)
      else
        FILESIZE_OUT=$FILESIZE
      fi

      # Pad so all the lines align - firstline gets padded the other way
        PERMISSIONS="${(r:MAX_LEN[1]:)PERMISSIONS}"
      HARDLINKCOUNT="${(l:MAX_LEN[2]:)HARDLINKCOUNT}"
              OWNER="${(l:MAX_LEN[3]:)OWNER}"
              GROUP="${(l:MAX_LEN[4]:)GROUP}"
       FILESIZE_OUT="${(l:MAX_LEN[5]:)FILESIZE_OUT}"

      # --------------------------------------------------------------------------
      # Colour the permissions - TODO
      # --------------------------------------------------------------------------
      # Colour the first character based on filetype
      FILETYPE="${PERMISSIONS[1]}"
      if (( IS_DIRECTORY ))
        then
        FILETYPE=${FILETYPE//d/$'\e[1;36m'd$'\e[0m'};
      elif (( IS_SYMLINK ))
        then
        FILETYPE=${FILETYPE//l/$'\e[0;35m'l$'\e[0m'};
      elif [[ $FILETYPE == "-" ]];
        then
        FILETYPE=${FILETYPE//-/$'\e[0;37m'-$'\e[0m'};
      fi

      # Permissions Owner
      PER1="${PERMISSIONS[2,4]}"

      # Permissions Group
      PER2="${PERMISSIONS[5,7]}"

      # Permissions User
      PER3="${PERMISSIONS[8,10]}"

      PERMISSIONS_OUTPUT="$FILETYPE$PER1$PER2$PER3"

      # --x --x --x warning
      if [[ $PER1[3] == "x" || $PER2[3] == "x" || $PER3[3] == "x" ]]; then
        IS_EXECUTABLE=1
      fi

      # --- --- rwx warning
      if [[ $PER3 == "rwx" ]] && (( ! IS_SYMLINK )); then
        PERMISSIONS_OUTPUT=$'\e[30;41m'"$PERMISSIONS"$'\e[0m'
      fi

      # --------------------------------------------------------------------------
      # Colour the symlinks - TODO
      # --------------------------------------------------------------------------

      # --------------------------------------------------------------------------
      # Colour Owner and Group
      # --------------------------------------------------------------------------
      OWNER=$'\e[38;5;241m'"$OWNER"$'\e[0m'
      GROUP=$'\e[38;5;241m'"$GROUP"$'\e[0m'

      # --------------------------------------------------------------------------
      # Colour file weights
      # --------------------------------------------------------------------------
      COLOR=LARGE_FILE_COLOR
      for i j in ${SIZELIMITS_TO_COLOR[@]}
      do
        (( FILESIZE <= i )) || continue
        COLOR=$j
        break
      done

      FILESIZE_OUT=$'\e[38;5;'"${COLOR}m$FILESIZE_OUT"$'\e[0m'

      # --------------------------------------------------------------------------
      # Colour the date and time based on age, then format for output
      # --------------------------------------------------------------------------
      # Setup colours based on time difference
      TIME_DIFF=$(( K_EPOCH - DATE[1] ))
      TIME_COLOR=$ANCIENT_TIME_COLOR
      for i j in ${FILEAGES_TO_COLOR[@]}
      do
        (( TIME_DIFF < i )) || continue
        TIME_COLOR=$j
        break
      done

      # Format date to show year if more than 6 months since last modified
      if (( TIME_DIFF < 15724800 )); then
        DATE_OUTPUT="${DATE[2]} ${(r:5:: :)${DATE[3][0,5]}} ${DATE[4]}"
      else
        DATE_OUTPUT="${DATE[2]} ${(r:6:: :)${DATE[3][0,5]}} ${DATE[5]}"  # extra space; 4 digit year instead of 5 digit HH:MM
      fi;
      DATE_OUTPUT[1]="${DATE_OUTPUT[1]//0/ }" # If day of month begins with zero, replace zero with space

      # Apply colour to formated date
      DATE_OUTPUT=$'\e[38;5;'"${TIME_COLOR}m${DATE_OUTPUT}"$'\e[0m'

      # --------------------------------------------------------------------------
      # Colour the repomarker
      # --------------------------------------------------------------------------
      if [[ "$o_no_vcs" != "" ]]; then
        REPOMARKER=""
      elif (( IS_GIT_REPO != 0)); then
        # If we're not in a repo, still check each directory if it's a repo, and
        # then mark appropriately
        if (( INSIDE_WORK_TREE == 0 )); then
          if (( IS_DIRECTORY )); then
            if command git --git-dir="$GIT_TOPLEVEL/.git" --work-tree="${NAME}" diff --stat --quiet --ignore-submodules HEAD &>/dev/null # if dirty
              then REPOMARKER=$'\e[38;5;46m|\e[0m' # Show a green vertical bar for clean
              else REPOMARKER=$'\e[0;31m+\e[0m' # Show a red vertical bar if dirty
            fi
          fi
        else
          if (( IS_DIRECTORY )); then
            # If the directory isn't ignored or clean, we'll just say it's dirty
            if command git check-ignore --quiet ${NAME} 2>/dev/null; then STATUS='!!'
            elif command git diff --stat --quiet --ignore-submodules ${NAME} 2> /dev/null; then STATUS='';
            else STATUS=' M'
            fi
          else
            # File
            STATUS=$(command git status --porcelain --ignored --untracked-files=normal $GIT_TOPLEVEL/${${${NAME:a}##$GIT_TOPLEVEL}#*/})
          fi
          STATUS=${STATUS[1,2]}
            if [[ $STATUS == ' M' ]]; then REPOMARKER=$'\e[0;31m+\e[0m';     # Tracked & Dirty
          elif [[ $STATUS == 'M ' ]]; then REPOMARKER=$'\e[38;5;082m+\e[0m'; # Tracked & Dirty & Added
          elif [[ $STATUS == '??' ]]; then REPOMARKER=$'\e[38;5;214m+\e[0m'; # Untracked
          elif [[ $STATUS == '!!' ]]; then REPOMARKER=$'\e[38;5;238m|\e[0m'; # Ignored
          elif [[ $STATUS == 'A ' ]]; then REPOMARKER=$'\e[38;5;082m+\e[0m'; # Added
          else                             REPOMARKER=$'\e[38;5;082m|\e[0m'; # Good
          fi
        fi
      fi

      # --------------------------------------------------------------------------
      # Colour the filename
      # --------------------------------------------------------------------------
      # Unfortunately, the choices for quoting which escape ANSI color sequences are q & qqqq; none of q- qq qqq work.
      # But we don't want to quote '.'; so instead we escape the escape manually and use q-
      NAME="${${NAME##*/}//$'\e'/\\e}"    # also propagate changes to SYMLINK_TARGET below

      if (( IS_DIRECTORY ))
      then
        NAME=$'\e[38;5;32m'"$NAME"$'\e[0m'
      elif (( IS_SYMLINK ))
      then
        NAME=$'\e[0;35m'"$NAME"$'\e[0m'
      fi

      # --------------------------------------------------------------------------
      # Format symlink target
      # --------------------------------------------------------------------------
      if [[ $SYMLINK_TARGET != "" ]]; then SYMLINK_TARGET="-> ${SYMLINK_TARGET//$'\e'/\\e}"; fi

      # --------------------------------------------------------------------------
      # Display final result
      # --------------------------------------------------------------------------
      print -r -- "$PERMISSIONS_OUTPUT $HARDLINKCOUNT $OWNER $GROUP $FILESIZE_OUT $DATE_OUTPUT $REPOMARKER $NAME $SYMLINK_TARGET"

      k=$((k+1)) # Bump loop index
    done
  done
}

# http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
# vim: set ts=2 sw=2 ft=zsh et :


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cfr=/usr/local/bin/cfr-decompiler
alias procyon=/usr/local/bin/procyon-decompiler

PERL_MB_OPT="--install_base \"/Users/dbotella/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/dbotella/perl5"; export PERL_MM_OPT;

setopt promptsubst
# PROMPT='$(battery_level_gauge) %{$fg[green]%}%*%{$reset_color%} %{$fg_no_bold[021]%}%n%{${fg_bold['021']}%}@%{$reset_color%}%{$fg[yellow]%}%m%{$reset_color%} %{$fg_no_bold[magenta]%} ➜ %{$reset_color%} %{${fg[green]}%}%3~ $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '
PROMPT='$(battery_level_gauge) %F{165}%*%{$reset_color%} %F{021}%n%{$reset_color%}%F{008}@%{$reset_color%}%F{021}%m%{$reset_color%} %F{008} ➜ %{$reset_color%} %F{165}%3~ $(git_prompt_info)%{$reset_color%} %F{008}»%{$reset_color%}'
# PROMPT='$(battery_time_remaining) %F{165}%*%{$reset_color%} %F{021}%n%{$reset_color%}%F{008}@%{$reset_color%}%F{021}%m%{$reset_color%} %F{008} ➜ %{$reset_color%} %F{165}%3~ $(git_prompt_info)%{$reset_color%} %F{008}»%{$reset_color%}'

# Colorize the tabs

function tab-color() {
    if [[ $# == 1 ]]
    then
        # convert hex to decimal
        hex=$1
        if [[ ${hex:0:1} == "#" ]]
        then
            # strip leading hash sign
            hex=${hex:1:6}
        fi
        if [[ ${#hex} == 3 ]]
        then
            # handle 3-letter hex codes
            hex="${hex:0:1}${hex:0:1}${hex:1:1}${hex:1:1}${hex:2:1}${hex:2:1}"
        fi
        r=$(printf "%d" 0x${hex:0:2})
        g=$(printf "%d" 0x${hex:2:2})
        b=$(printf "%d" 0x${hex:4:2})
    else
        r=$1
        g=$2
        b=$3
    fi
    echo -ne "\033]6;1;bg;red;brightness;$r\a"
    echo -ne "\033]6;1;bg;green;brightness;$g\a"
    echo -ne "\033]6;1;bg;blue;brightness;$b\a"
}
# Color from Google material design
# https://www.google.com/design/spec/style/color.html#color-color-palette
function tab-red() { tab-color "#f44336"; }
function tab-pink() { tab-color "#e91e63"; }
function tab-purple() { tab-color "#9c27b0"; }
function tab-deep-purple() { tab-color "#673ab7"; }
function tab-indigo() { tab-color "#3f51b5"; }
function tab-blue() { tab-color "#2196f3"; }
function tab-light-blue() { tab-color "#03a9f4"; }
function tab-cyan() { tab-color "#00bcd4"; }
function tab-teal() { tab-color "#009688"; }
function tab-green() { tab-color "#4caf50"; }
function tab-light-green() { tab-color "#8bc34a"; }
function tab-lime() { tab-color "#cddc39"; }
function tab-yellow() { tab-color "#ffeb3b"; }
function tab-amber() { tab-color "#ffc107"; }
function tab-orange() { tab-color "#ff9800"; }
function tab-deep-orange() { tab-color "#ff5722"; }
function tab-brown() { tab-color "#795548"; }
function tab-grey() { tab-color "#9e9e9e"; }
function tab-blue-grey() { tab-color "#607d8b"; }
function tab-white() { tab-color "#ffffff"; }
function tab-black() { tab-color "#000000"; }


# Login message

if [[ -o interactive ]]; then

    #  This works for both Terminal.app and iTerm.app as well as X-term
    #  set the title and tab values to current directory
    #  Stuff that appears when the interactive shell starts up:

		print ""

    # Give time since last reboot.  Blank print statement gives us a new line
    uptime=$(uptime 2>/dev/null )
    print "\e[36mTime: $uptime \e[0m"

    # Tell us what computer we are on and what directory we are in
    print "\e[36m$HOST\e[0m\:\:\e[36m$PWD\e[0m"


    # What version of zsh are we running?
    print "\e[36mInitializing zsh version number $ZSH_VERSION \e[0m"

		if [ $ITERM_PROFILE ]; then
			print "\e[36mInitializing iterm profile \"$ITERM_PROFILE\" \e[0m"
			if [ $ITERM_PROFILE=='White for Default' ]; then
				tab-white
			fi
		fi


		if [ $TMUX_PANE ]; then
			print "\e[36mInitializing tmux pane $TMUX_PANE \e[0m"
		fi
		print ""

fi  #  [[ -o interactive ]]

# Autojump

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
	

figlet  -f chunky "Hello, zsh"

alias cd_office_library="cd $HOME/Library/Application\ Support/Microsoft/Office"
alias open_mes_modeles="cd $HOME/Library/Application\ Support/Microsoft/Office/Mode<0300>les\ utilisateur/Mes\ mode<0300>les; open ."

alias vscode="/opt/homebrew-cask/Caskroom/visual-studio-code/latest/VSCode-darwin-signed/Visual\ Studio\ Code.app/Contents/MacOS/Electron"

alias ll='ls -alFh'

# alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# For fzf 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
