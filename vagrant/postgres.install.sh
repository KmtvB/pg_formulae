# from https://gist.github.com/davisford/8000332

echo "-------------------- updating package lists"
# https://github.com/hashicorp/vagrant/issues/289#issuecomment-41962600
echo "set grub-pc/install_devices /dev/sda" | debconf-communicate
apt-get -y -qq update
apt-get -y -qq upgrade
# gotta put this before the upgrade, b/c it reboots and then all commands are lost
echo "-------------------- installing postgres"
apt-get install postgresql postgresql-server-dev-9.1 -y
# fix permissions
echo "-------------------- fixing listen_addresses on postgresql.conf"
sudo sed -i "s/#listen_address.*/listen_addresses '*'/" /etc/postgresql/9.1/main/postgresql.conf
echo "-------------------- fixing postgres pg_hba.conf file"
# replace the ipv4 host line with the above line
sudo cat >> /etc/postgresql/9.1/main/pg_hba.conf <<EOF
# Accept all IPv4 connections - FOR DEVELOPMENT ONLY!!!
host    all         all         0.0.0.0/0             md5
EOF
echo "-------------------- creating postgres vagrant role with password vagrant"
# Create Role and login
sudo su postgres -c "psql -c \"CREATE ROLE vagrant SUPERUSER LOGIN PASSWORD 'vagrant'\" "
echo "-------------------- creating wtm database"
# Create WTM database
sudo su postgres -c "createdb -E UTF8 -T template0 --locale=en_US.utf8 -O vagrant wtm"
echo "-------------------- upgrading packages to latest"
apt-get upgrade -y