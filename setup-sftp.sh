# https://linuxhint.com/setup-sftp-server-ubuntu/

# install ssh
sudo apt install ssh

# change sshd configuration for sftp group: 
# add the following to the end of /etc/ssh/sshd_config
Match group sftp
ChrootDirectory /home 
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp


# restart service
sudo systemctl restart ssh



# create a dedicated user
sudo addgroup sftp
sudo useradd -m sftp_user -g sftp
sudo passwd sftp_user

# grant everybody access to sftp_user's home directory
sudo chmod 777 /home/sftp_user/
