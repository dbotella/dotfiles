xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
brew doctor

# from https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Interesting-Taps-&-Branches.md
brew tap homebrew/dupes
brew tap homebrew/apache
brew tap homebrew/devel-only

brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts

