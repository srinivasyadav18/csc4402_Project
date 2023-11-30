
# Install mysql server on ubuntu container
sudo apt update -y
sudo apt upgrade -y
sudo apt install mysql-server python3 -y

# start the myql service
sudo service mysql start 

# install python interface to connect to mysql server
pip install mysql-connector-python

# create a fake root user name admin user
sudo mysql < create_admin.sql

# create warehouse database and load dummy data
sudo mysql < warehouse_db.sql
sudo mysql < data.sql
