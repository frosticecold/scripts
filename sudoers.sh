#!/bin/bash

#vars
debian="Debian GNU/Linux"
centos="CentOS Linux"
installer=""
sudogroup=""

#checkDistro
function checkDistro {
    
    currentdistro=$(cat /etc/os-release | grep -w "NAME" | cut -d \" -f2)
    
    if [ currentdistro -eq debian ]

        then 
            installer="apt-get install"
            sudogroup="sudo"
        else
            if [ currentdistro -eq centos ]
                then
                    installer="yum install"
                    sudogroup="wheel"
            fi
    fi
}

#Login Username
function getUsername {

    tmpuser=$(logname)
    permissions="\n$tmpuser	ALL=(ALL:ALL) ALL\n"
}

#Install sudo
function installSudo {

        apt-get install -y sudo
        line=$(grep -n "%sudo" /etc/sudoers | cut -d : -f 1)
        let "line+=1"
}

#Check if running by root
function checkRoot {

        if [ "$(id -u)" != "0" ]; then
                echo "This script must be run as root" 1>&2
                exit 1
        fi
}

#Edit sudoers file

checkRoot
installSudo

#install sudo hard mode
sed -ie "${line}s/^/$permissions/" /etc/sudoers

#add user to sudo group

#
#Recommended
#usermod -aG sudo user
