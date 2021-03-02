# accel-ppp-builder

Run `run.sh` and get your deb package in `build/deb` dir.

Run `docker run -it  -v ${PWD}/build:/build accell-ppp-builder` to rebuild it.


# install

```
dpkg -i accell-ppp*.deb
apt -f install

cp /etc/accel-ppp.conf.dist /etc/accel-ppp.conf

cat << EOF > /etc/systemd/system/accel-ppp.service 
[Unit]
Description=Accel-PPP
After=network.target

[Service]
ExecStart=/usr/sbin/accel-pppd -d -p /var/run/accel-pppd.pid -c /etc/accel-ppp.conf
StandardOutput=null
ExecReload=/bin/kill -SIGUSR1 $MAINPID
PIDFile=/var/run/accel-pppd.pid
Type=forking
Restart=always

[Install]
WantedBy=multi-user.target
Alias=accel-ppp.service

EOF

nano /etc/accel-ppp.conf
systemctl start accel-ppp.service
```
