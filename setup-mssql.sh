# https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver16

# install mssql 
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"

sudo apt-get update
sudo apt-get install -y mssql-server



# setup mssql server
sudo /opt/mssql/bin/mssql-conf setup



# verify service status is running
systemctl status mssql-server --no-pager



# install mssql command line tools
sudo apt-get update
sudo apt install curl

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

sudo apt-get update
sudo apt-get install mssql-tools unixodbc-dev



# add bin directory to PATH, for sqlcmd and bcp
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.config/zsh/.zshrc
source ~/.bashrc



# open port 1433
# ufw = uncomplicated firewall on ubuntu
sudo ufw enable
sudo ufw allow 1433

# ---

# change the default data directories
sudo mkdir -p /srv/mssql/data
sudo mkdir -p /srv/mssql/logs
sudo chmod 777 /srv/mssql/data
sudo chmod 777 /srv/mssql/logs

sudo /opt/mssql/bin/mssql-conf set filelocation.defaultdatadir /srv/mssql/data
sudo /opt/mssql/bin/mssql-conf set filelocation.defaultlogdir /srv/mssql/logs
sudo systemctl restart mssql-server

# ---

# restore bak files: 
DBNAME=wordnet
RESTORECOMMAND="RESTORE DATABASE $DBNAME FROM DISK=N'/home/sftp_user/sql/$DBNAME.bak' WITH FILE = 1, MOVE N'$DBNAME' to '/srv/mssql/data/$DBNAME.mdf', MOVE N'${DBNAME}_log' to '/srv/mssql/logs/$DBNAME.mdf'"
sudo /opt/mssql-tools/bin/sqlcmd -q $RESTORECOMMAND -U sa
