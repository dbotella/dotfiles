#!/usr/bin/env bash

# running "include my library helpers for colorized echo and require_brew, etc"

source ./lib.sh

bot "Standard System Changes"

running "Use column view in all Finder windows by default"
defaults write com.apple.Finder FXPreferredViewStyle -string "clmv"
running "Use list view in all Finder windows by default"
defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"



running "Show the ~/Library folder."
chflags nohidden ~/Library

running "Disable the \“Are you sure you want to open this application?\” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

running "Menu bar: disable transparency"
#defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

running "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

running "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

running "Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

running "Disable Resume system-wide"
#defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

running "Disable auto-correct"
#defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

running "Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons"
#defaults write com.apple.finder QuitMenuItem -bool true

running "Show status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

running "Enable full keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

running "Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "$HOME/Desktop"

running "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

running "Finder: show hidden files by default"
defaults write com.apple.Finder AppleShowAllFiles -bool true

running "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

running "Finder: allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true

running "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

running "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

running "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

running "Set the icon size of Dock items to 64 pixels"
defaults write com.apple.dock tilesize -int 64

running "Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

running "Disable dashboard"
defaults write com.apple.dashboard mcx-disabled -boolean true

running "Disable Game Center launching"
sudo defaults write /System/Library/LaunchAgents/com.apple.gamed Disabled -bool true




defaults write com.apple.dock static-only -bool TRUE
killall Dock
