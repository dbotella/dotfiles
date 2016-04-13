#export PACKAGER=dnf 
export PACKAGER=dnf 

sudo $PACKAGER install emacs vim
sudo $PACKAGER install zsh
sudo $PACKAGER install java-1.8.0-openjdk java-1.8.0-openjdk-plugin
sudo $PACKAGER install java-1.8.0-openjdk-devel java-1.8.0-openjdk-javadoc java-1.8.0-openjdk-src
sudo $PACKAGER install gnome-tweak-tool

# For fedora
sudo $PACKAGER groupinstall "Development Tools" "Development Libraries"
sudo $PACKAGER install adobe-source-code-pro-fonts adobe-source-sans-pro-fonts
