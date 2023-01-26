# install dependencies
sudo apt install dnsutils dnsmasq-base

# install pi-hole 
curl -sSL https://install.pi-hole.net | bash

# lighttpd is the web server for hosting the admin page
# it gets installed by the pi-hole bash script

# make sure lighttpd is running 
sudo systemctl status lighttpd

# open ports 
sudo ufw allow 80/tcp
sudo ufw allow 53/tcp
sudo ufw allow 53/udp
sudo ufw allow 67/tcp
sudo ufw allow 67/udp
sudo ufw allow 546:547/udp


# verify
pihole status

# to configure dns on tplink deco router: 
# advanced -> dhcp server: set Primary DNS to the IP of your pihole server

# android devices: 
# settings -> network and internet -> advanced: private dns
# make sure private dns is off - by default it is set to automatic

###############################################################################
# to configure individual devices separately: 

# windows:
# Control Panel\Network and Internet\Network Connections
# right click an adapter and choose properties 
# - ("NordLynx" if you're on vpn, "Wi-Fi" if not) 
# right click ipv4 and choose properties 
# change primary DNS address to your pi-hole server's ip

# ios: 
# settings -> wi-fi -> <your-network> -> configure dns: 
# manual, add server, add your pi-hole server's ip
