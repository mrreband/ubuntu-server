# add an apt reference to the package
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# install
sudo apt install mongodb-org

# start service
sudo systemctl start mongod
sudo systemctl status mongod

# set service to restart on reboot
sudo systemctl enable mongod

# create an admin user
mongo admin --eval "db.createUser({user: 'admin', pwd: '$MONGODB_PASSWORD', roles: [{role: 'root', db: 'admin'}]})"

# restart service (auth will then be enabled since there's an admin user)
sudo systemctl restart mongod

# test connection
mongo -u "admin" -p "adminpwd" --authenticationDatabase "admin"

# open port 27017
sudo ufw allow 27017
sudo ufw reload

# to add a user with full control of a specific database: 
mongo admin --eval "db.createUser({user: 'inigo', pwd: '$PWD', roles: [{role: 'readWrite', db: 'codebooks'}]})"


# first, put the password in a .env file, then load it to the environmet.  
# This will make sure the password doesn't end up in the shell history or the mongo command history
export $(grep -v '^#' .env | xargs)

