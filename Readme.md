## ВКР

## Compling
```
cc -fPIC /vagrant/pslib/example.c -o /home/vagrant/mypostgreslib/temp.o
cc -shared -o /vagrant/pslib/example.so /home/vagrant/mypostgreslib/temp.o
```