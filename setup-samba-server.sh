# install samba
sudo apt install samba

# check the version number
samba --version

# check the status is running -- the service name is smbd
sudo systemctl status smbd

# open port
sudo ufw allow samba

# install wsd to allow windows to see it
sudo curl -o /usr/bin/wsdd https://raw.githubusercontent.com/christgau/wsdd/master/src/wsdd.py
sudo systemctl enable wsdd.service
