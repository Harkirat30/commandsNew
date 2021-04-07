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