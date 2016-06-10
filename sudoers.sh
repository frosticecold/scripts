#!/bin/bash

#Login Username
tmpuser=$(logname)
permissions="\n$tmpuser	ALL=(ALL:ALL) ALL\n"
apt-get install -y sudo
line=$(grep -n "%sudo" /etc/sudoers | cut -d : -f 1)
let "line+=1"

#Check if running by root
function checkRoot {

        if [ "$(id -u)" != "0" ]; then
                echo "This script must be run as root" 1>&2
                exit 1
        fi
}

#Edit sudoers file

checkRoot
sed -ie "${line}s/^/$permissions/" /etc/sudoers

