# install packages
# postgresql - core server
# postgresql-contrib - a collection of optional tools and utilities

sudo apt install postgresql postgresql-contrib

# start
sudo systemctl start postgresql
sudo systemctl status postgresql

# change to postgres user to create a new user
# NOTE: since v9.1, `createuser` is deprecated and replaced by `CREATE ROLE` command 
sudo -i -u postgres
createuser --interactive
 
  # Enter name of role to add: mr
  # Shall the new role be a superuser? (y/n) y

  # # NOTE: if you say no to the superuser, you'll also get these questions: 
  # Shall the new role be allowed to create databases? (y/n) n
  # Shall the new role be allowed to create more new roles? (y/n) n

# exit out of postgres user
exit

# start psql with your account
# use `-d postgres` to start in the postgres database (the only existing database)
# by default, psql will attempt to connect to a database with the name that matches the user
psql -d postgres

  # # create new database with a name that matches your username
  # create database mr

  # # change the password for new username
  # \password mr

  # # exit
  # exit

# now connect without the `-d` flag to start in your user's database
psql

  # meta commands: 
  # use \l to show databases
  # use \c to switch databases
  # use \dt to show all tables in your databases
  # use \dt * to show all tables in all databases
  # use \z to show granted permissions
  # use \q to quit

# if you connect with -E flag, then you will see the real-query when you use a meta-command

###################################################################
# configure to allow incoming connections

# open port 5432
sudo ufw allow postgresql

# alter postgresql.conf
cd  /etc/postgresql/12/main/

sudo nano postgresql.conf

  # # update listen_addresses to listen on all (default is localhost only)
  # listen_addresses = '*'          # custom rule

# alter pg_hba.conf
sudo nano pg_hba.conf

  # # add a new rule to allow all devices on the network
  # host    all             all             192.168.68.0/24         md5   # custom rule

# cat postgresql.conf | grep listen_addresses
# cat pg_hba.conf | grep 192.168.68.0

# restart 
sudo systemctl restart postgresql
sudo systemctl status postgresql

# verify the port is open (should have two entries)
netstat -tunelp | grep 5432

# finally, configure to startup on reboot
sudo systemctl enable postgresql
