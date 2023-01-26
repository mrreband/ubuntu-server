########################################################################
# setting up development environment for python (pyenv) and node (fnm)
########################################################################

# install pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.config/zsh/zsh-exports
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.config/zsh/zsh-exports
source ~/.config/zsh/.zshrc

# verify
pyenv --version

# change permissions of the config file
sudo chown -R $USER:$USER ~/.pyenv

# use pyenv to install python versions
pyenv install 3.11 

# set default global python version
pyenv global 3.11


####################################################################

# install fnm
# (requires install curl and uzip)
sudo apt install unzip curl
sudo curl -fsSL https://fnm.vercel.app/install | bash

# use fnm to install node versions
fnm install 18

