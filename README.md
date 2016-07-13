# Scripts
Just my scripting adventures

My scripts are my own adventure , automating little projects, one at a time.
My goal is aimed at better out the box quality of life.
Server applications deployment with ease, learning to break stuff and fix it.

I work mostly with Debian/CentOS

  non-free.sh 

             |-> Based on https://gist.github.com/kstefanini/b22c9775fb19fc41c8f3
             
             |-> Edits source.list based on debian http redirector
             
             |-> Adds main, contrib, non-free Repos
             
             |-> Adds Backports

  sudoers.sh  
  
             |-> Detect current distro/os

             |-> Copys the session username
             
             |-> Installs sudo
             
             |-> Adds current username to sudo group (Recommended)
             
             |-> Hardcodes user into sudoers file (Not recommeded)

  webmin.sh

             |-> Adds webmin.list to source.list.d
             
             |-> Installs webmin
             
