#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list.d/webmin.list

wget http://www.webmin.com/jcameron-key.asc -P /tmp
apt-key add /tmp/jcameron-key.asc
rm /tmp/jcameron-key.asc

sudo apt-get update
sudo apt-get install -y webmin

