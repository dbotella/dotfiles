#!/usr/bin/env bash

# running "include my library helpers for colorized echo and require_brew, etc"

source ./lib.sh

bot "Installation of Oh My Zsh"

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh


bot "Installation of Homebrew"
# http://brew.sh
sh ./install-homebrew.sh
cat brew_list.txt | xargs brew install 
cat cask_list.txt | xargs brew cask install 


bot "Installation of The Ultimate Vim Distribution"
# http://vim.spf13.com/
curl http://j.mp/spf13-vim3 -L -o - | sh


./fix_mac_osx.sh
