# install helper packages (might already be installed)
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# add official docker gpg key and repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# install docker, cli, and containerd
# containerd.io is a replacement for docker's runtime `runC`
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

# verify 
docker --version

# start and enable on startup
sudo systemctl start docker
sudo systemctl enable docker

