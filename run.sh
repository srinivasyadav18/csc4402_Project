sudo apt update -y
sudo apt upgrade -y
sudo apt install mysql-server python3 -y

sudo service mysql start 
python3 -m venv env
source env/bin/activate
pip install mysql-connector-python
sudo mysql < create_admin.sql
sudo mysql < create_db.sql
python3 main.py