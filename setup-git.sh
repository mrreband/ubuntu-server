# basic global config
git config --global user.name "mrReband"
git config --global user.email "mr@reband.org"
git config --global init.defaultBranch main

# create a new ssh key for github
ssh-keygen -o -t rsa -C "github"

# paste the contents of the key into github: 
# https://github.com/settings/keys

