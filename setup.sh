#!/bin/bash

wget https://nodejs.org/dist/v9.5.0/node-v9.5.0-linux-armv7l.tar.gz;
tar -xzf ./node-v9.5.0-linux-armv7l.tar.gz;
sudo rm -rf /opt/nodejs;
sudo mv node-v9.5.0-linux-armv7l /opt/nodejs;
sudo unlink /usr/bin/node;
sudo unlink /usr/sbin/node;
sudo unlink /sbin/node;
sudo unlink /usr/local/bin/node;
sudo unlink /usr/bin/npm;
sudo unlink /usr/sbin/npm;
sudo unlink /sbin/npm;
sudo unlink /usr/local/bin/npm;
# Create symlinks to node && npm
sudo ln -s /opt/nodejs/bin/node /usr/bin/node;
sudo ln -s /opt/nodejs/bin/node /usr/sbin/node;
sudo ln -s /opt/nodejs/bin/node /sbin/node;
sudo ln -s /opt/nodejs/bin/node /usr/local/bin/node;
sudo ln -s /opt/nodejs/bin/npm /usr/bin/npm;
sudo ln -s /opt/nodejs/bin/npm /usr/sbin/npm;
sudo ln -s /opt/nodejs/bin/npm /sbin/npm;
sudo ln -s /opt/nodejs/bin/npm /usr/local/bin/npm;

/opt/nodejs/bin/npm i -g @freshit/lt;
/opt/nodejs/bin/npm i -g pm2;
sudo /opt/nodejs/bin/pm2 startup -u baikal;
/opt/nodejs/bin/pm2 start /opt/nodejs/bin/lt;
/opt/nodejs/bin/pm2 save;

# /opt/nodejs/bin/pm2 logs
