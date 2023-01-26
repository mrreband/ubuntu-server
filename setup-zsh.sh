####################################################
# install zsh
####################################################

# check existing default shell
echo $SHELL

# Installing Zsh in Ubuntu Linux
sudo apt install zsh
zsh --version

# set zsh as default
chsh -s $(which zsh) 

# reboot and verify
echo $SHELL

####################################################
# customize
####################################################

# install `exa` (better version of `ls`, referenced in the settings imported below)
wget -c http://old-releases.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb
sudo apt-get install ./exa_0.9.0-4_amd64.deb

# copy zsh settings from orue: 
# https://github.com/orue/my-zsh-profile

# clone to ~/.config/zsh
git clone git@github.com:orue/my-zsh-profile.git ~/.config/zsh

# point .zshenv to the local repo: 
echo "ZDOTDIR=$HOME/.config/zsh" > ~/.zshenv

# make a repos folder in the user's home directory
mkdir -p ~/repos
cd ~/repos

# install nerd fonts (use depth=1 because the repo is huge)
git clone --depth=1 git@github.com:ryanoasis/nerd-fonts.git

cd nerd-fonts
sudo ./install.sh
sudo apt-get update
sudo apt-get install fonts-inconsolata
