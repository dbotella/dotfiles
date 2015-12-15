# Use column view in all Finder windows by default
defaults write com.apple.Finder FXPreferredViewStyle -string "clmv"

 # Show the ~/Library folder.
chflags nohidden ~/Library

 # Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

 # Menu bar: disable transparency
#defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

 # Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

 # Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

 # Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

 # Disable Resume system-wide
#defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

 # Disable auto-correct
#defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

 # Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
#defaults write com.apple.finder QuitMenuItem -bool true

 # Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

 # Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

 # Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

 # Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

 # Finder: show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

 # Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

 # Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

 # When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

 # Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

 # Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

 # Set the icon size of Dock items to 36 pixels
#defaults write com.apple.dock tilesize -int 36

 # Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

 # Disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean true

# Disable Game Center launching
sudo defaults write /System/Library/LaunchAgents/com.apple.gamed Disabled -bool true


 # Number of recent items: 30 //TODO
 # Dock: Lock Dock Content //TODO
 # Dock: Lock icon size //TODO

 # Disable CapsLock // TODO
 # F keys without modifier // TODO
 # Tap to click // TODO