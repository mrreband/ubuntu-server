# install
sudo apt update
sudo apt install redis-server

# start service
sudo systemctl start redis-server
sudo systemctl status redis-server

# edit config file
sudo nano /etc/redis/redis.conf

# enable service to reload on reboot
sudo systemctl enable redis-server

# test server with redis-cli
redis-cli ping
