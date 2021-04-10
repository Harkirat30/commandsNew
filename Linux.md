Description: Things learned in Mongo 
author: "Harkirat Singh"
Date: "Mar-28,2021"

**************************************************************************************
# Ports, ports commands and adding DNS entry in /etc/hosts for Minkikube Ingress

port *80* is for http and *443* is for https traffic
ssh - 22 
Command -->>> *netstat -n* {to see the active connections}
Command ->>>> *netstat -a -b -n* 
command -->> *tee* --- used to send output to a file as well as standard out.. Meaning you won't have to write 2 commands , tee can be used 
*-a* flag can be used if you want tee to append to a file 
EXAMPLE --------------------->>>>>>>>>>>>>>>>   *echo "$(minikube ip) harkirat-singh.com" | sudo tee -a /etc/hosts*



**************************************************************************************************
*LINUX commands*
- to get the Ip of the system use -->> hostname -I command 
- Following commands are there to get IP ---->> ip a, ifconfig , hostname -I
- To check the release version -->> # command --> cat /etc/os-release
# sudo usermod -aG <group> <username>
ABOVE COMMAND WILL ADD A USER TO A GROUP SO THAT U WON"T NEED TO USE SUDO,
eg - sudo usermod -aG docker harkirat30
Now restart and see the magic, you would be able to run direct command --> docker images rather than sudo docker images

- apt update means we are updating the package repository index 


******************************************************************************
Whenever you are installing something using pip or pip3 - use the followuing syntax:

pip defaults to installing Python packages to a system directory (such as /usr/local/lib/python3.4). This requires root access.

--user makes pip install packages in your home directory instead, which doesn't require any special privileges.

**************************************************************
 *Trying to login as a user sverma* --Logging in as a Different USer
 ---> Command -->> su -sverma
 
 # becoming a root user
 To become a root user your User need to have appropiate field added in visudo file - /etc/sudoers.tmp and 
 you can become root user by command --->>> sudo su -
 
 # checking uid of a user
 If you want to check the uid,gid and group of the user run the command --> id <user> , eg - id harkirat30
 groups can be checked in ------->>> cat /etc/group
 
 # checking os version
 uname -r ---->> command will give OS version
 
 # checking time stamp
 ls -ltr command is used to check the time stamp 
 
 du command is used to check the disk usage of a paticular directory
 du -h : will give size properly
 du -c : Total value by current Working Dir
 du -a : will give hidden files value also
 
 df -h : where my disk is mounted 