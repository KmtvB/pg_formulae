
export C_INCLUDE_PATH=/usr/include/postgresql/9.1/server

echo "dynamic_library_path = /home/vagrant/mypostgreslib" >> /etc/postgresql/9.1/main/postgresql.conf

if [ ! -d "/home/vagrant/mypostgreslib" ]; then
  mkdir /home/vagrant/mypostgreslib
  chown vagrant /home/vagrant/mypostgreslib
fi
