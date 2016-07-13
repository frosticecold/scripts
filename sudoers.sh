#!/bin/bash

#vars
debian="Debian GNU/Linux"
centos="CentOS Linux"
ubuntu="Ubuntu"
installer=""
sudogroup=""
tmpuser=$(logname)

#checkDistro
function checkDistro {
    
    currentdistro=$(cat /etc/os-release | grep -w "NAME" | cut -d \" -f2)
    echo $currentdistro
	}

#Login Username
function hardUser {

    permissions="\n$tmpuser	ALL=(ALL:ALL) ALL\n"
}

#Install sudo
function installSudo {
	if [ ! -f "/etc/sudoers" ]
	then
		echo "Sudoers file exist"
		if [[ $currentdistro == $debian ]] || [[ $currentdistro == $ubuntu ]]
		then
			apt-get install -y sudo
		elif [[ $currentdistro == $centos ]]
		then
			yum -y install sudo
		fi        
	        #line=$(grep -n "%sudo" /etc/sudoers | cut -d : -f 1)
	        #let "line+=1"
	fi
}

#Check if running by root
function checkRoot {

        if [ "$(id -u)" != "0" ]; then
                echo "This script must be run as root" 1>&2
                exit 1
        fi
}

function checkSuccess {
	if [ $(groups | grep -c "sudo") == 1 ]
	then
		echo "Success, user is in group."
	fi
}

#Soft add user
function softUser {
	echo "Adding user to sudoers file..."
	case $currentdistro in
		$debian)
			usermod -aG sudo $tmpuser
			checkSuccess
			su $tmpuser
			;;
		$centos)
			usermod -aG wheel $tmpuser
			checkSuccess
			su $tmpuser
			;;
	esac
}
#Edit sudoers file

checkRoot
checkDistro
installSudo
softUser

#install sudo hard mode
#sed -ie "${line}s/^/$permissions/" /etc/sudoers

#add user to sudo group

#
#Recommended
#usermod -aG sudo user
