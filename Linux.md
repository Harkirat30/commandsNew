Description: Things learned in Mongo 
author: "Harkirat Singh"
Date: "Mar-28,2021"

**************************************************************************************
# Ports, ports commands and adding DNS entry in /etc/hosts for Minkikube Ingress

port *80* is for http and *443* is for https traffic
ssh - 22 
Command -->>> *netstat -n* {to see the active connections}
Command ->>>> *netstat -a -n* 

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

- **apt update means we are updating the package repository index **


******************************************************************************
Whenever you are installing something using pip or pip3 - use the followuing syntax:

pip defaults to installing Python packages to a system directory (such as /usr/local/lib/python3.4). This requires root access.

**--user makes pip install packages in your home directory instead, which doesn't require any special privileges.**

**************************************************************
 *Trying to login as a user sverma* --Logging in as a Different USer
 ---> Command -->> su - sverma
 
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
 
**df -h : where my disk is mounted**

 ****************
 Note : Everything gets installed in usr/share

bc is  a language for doing arithmetic operations 
scale will set the value upto that decimal places 
to use math library we need to use -l 

LANG=C

***********************
chmod [options] mode filename
options -R(recursive) , -f (force) , -v (verbose)
**r(4),w(2),x(1)**
eg - chmod -R 774 filename


If DHCP is enabled then the Ip address is Dynamic and vice versa

gzip and gunzip is to decompress and extract files in Linux

*******************************************
*tar and untar*

tar cvf Tarname filename1 filename2 and tar -xvf Tarname to compress and decompress multiple tar files

sudo useradd rohan
sudo passwd rohan

gnome-terminal command will open a new terminal 
IFS=' ' read -r line   :: Input redirection

*******************

*SCP COMMAND*

# Pre-requisites 

1) service ssh start on both machines
2) options --> scp -c (for compressing files )
3) scp -v (verbose)
4) The key should be present at ssh path --->>> ~/.ssh as by default scp looks at the ssh path 

Command --->>  **scp -i <pathtothekeyshared> <filetobetransferred> username@ip:/path/**

How to find timezone -->> cat /etc/timezone


*************************************

*DATE COMMAND*

*****DATE IN SHELL SCRIPT*****************************

command ->> date

1) date +%s   
2) date +%m   - month 
3) date +%M   - minute
4) date +%H   - hour
5) date +%S   - second
6) date +%d   - day of the month
7) date +%Y   - Year in 2 digit format
8) date +%m/%d/%Y  - 06/10/2021
9) date +%m/%d/%y  - 06/10/21
10) date +%F  - 2021-06-10
11) date +%a - Thu
12) date +%A - Thursday
13) date +%H:%M:%S - Timestamp - 12:23:59
14) man date 
15) %n - shifting to a new line
16) date +Hours:%H%nMinutes:%M%nSeconds:%S  -- generates output in diff lines
17) date +%D --> 06/10/21
18) Want to give a specific date --> date -d "1/2/2016 1am"  ------>>> Saturday 02 January 2016 01:00:00 AM IST
19) date -d "1/2/2016 1:12:12" --->> Saturday 02 January 2016 01:12:12 AM IST
20) Finding day -->> date -d "1/2/2016" +%a  --output is Sat
21) Finding day -->> date -d "1/2/2016" +%A  --output is Saturday
22) date -d "July 2 2019" +%a -- Tue
23) date -d "tomorrow"
24) date -d tomorrow +"%d-%m-%y" , if today is 10June, we will get --> 11-06-21
25) date -d last-week +"%d-%m-%y"  -- command to get one week prior date --- > 03-06-21
26) date -d 11 days +"%d-%m-%y"
27) date -d -11 days +"%d-%m-%y"
28) date -d "-33 days" +"%d-%m-%y" --value comes as 08-05-21 and current date is 10-06-21
