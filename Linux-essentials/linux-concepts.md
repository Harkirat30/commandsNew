
********************************INSTALLING UPDATES IN LINUX (UBUNTU)****************************************

1) sudo apt update 

This command is used to update package index 
Above command is used to synchronize the index of local with that of a remote server, apt is a package maneger of ubuntu ,
basically we are pulling a software from a remote server, but you first have to update the index ,
after updating the index the packages which we have listed locally are the actual truth when it comes to the ones present on remote server
 
2) sudo apt dist-upgrade   OR sudo apt upgrade  (minor diff is there - it won't install all the updates, it will only install updates for those packages which doesn't require another package to be installed or removed )

Above command is used to actually upgrade the packages

3) sudo reboot
Run this command to reboot the instance

*********************************Setting hostname of linux workstation or server***************

1) hostname 
it will show you the hostname
hostname is stored in /etc/hostname file 

2) hostnamectl 
this command will give detailed info about the hostname 
Changing hostname --> **sudo hostnamectl set-hostname <new-host-name>**
and in new terminal window - you will have the updated hostname 

note: if you want to see it in the same terminal run -> exec bash 

# NOTE: after updating the name using hostnamectl - you need to manually update the name in /etc/hosts

Update like below 

127.0.0.1       localhost
127.0.1.1       **ts-india-0032**
65.8.227.58 go.com go
# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters




***********************************APT***************************************

1) apt update 
Basically this command is used to check what packages are available and at what versions 

we can install packages using apt, so command for that is -> sudo apt install <package-name-1> <package-name-2> <package-name-3> , eg -> sudo apt install tmux
>It will install all dependencies also which are required for the package 

2) removing an application 
command --> sudo apt remove <package-name1> <package-name-2> <package-name-3>

3) apt search <package-half-name>
so basically apt is used to search the exact packages names also 

4) Installing updates
# diff between apt update and apt dist-upgrade 

apt upgrade command is not going to install any updates that requires the installation of additional packages or removal of packages either, 
dist upgrade will install all of the upgrades regardless.

5) How does apt know where to get the updates from, 

when ubuntu in installed - it automatically sets up the lists of resources where it will fetch the updates from 

cat /etc/apt/sources.list 


***********PACKMAN COMMAND*****************************************************



















***************************************The Arch User Repository (AUR)*****************************************************
















***********************Navigating the linux File-system**********************************************************************
Basically it's the default layout of the directory on the linux system

1) ls -lrt /home/harkirat30/Desktop/
2) C drive in windows is equal to / in linux
3) lrwxrwxrwx   1 root       root                7 Nov  7  2020 bin -> usr/bin
l in front of permissions means it is a symbolic link, 
- is for file and d is for directory 
4) etc directory is a place where your system wide configuration is stored, also it is a target for backup
files inside etc applies system wide, while inside home applies to user

5) root user home directory is under -> / and folder is root 
6) home diretory will have list of users 
7) media and mnt directory under / are used for mounting external storage systems and even internal storage systems

8) we can also used /mnt and /media for mounting storage on a network share such as nfs, samba 
9) mnt is generally for permanent storage (for long time)--> network share also falls here 
10) media is for temporary storage 

11) mkdir -p folder1/folder2/folder3 (-p is used to create all dir at once, short for parent)
12) rm -r for dir and rm for files


**************************understanding files and Directory permissions********************************************************

1) drwxrwxr-x 3 harkirat30 harkirat30 4096 Jun  2 14:26 Ansible

The first section in a file, tells u if it is a directory(d), link (l)or a file(-)
rwx - represents the permissions of user -> harkirat30 (this user owns the file or folder)
second harkirat30 is the group that owns the file or directory
rwx - harkirat30 (permissions of the group)
-x (4th section)- permissions of others 
r- read (4), write(2), execute(1)
x- means execute - if it is a file i can execute that file , in case of a directory it means i can go inside the directory 

NOTE: if a file doesn't have executable permissions and you still want to execute that it can be done by using **bash <file-name>** command

2) chmod command

chmod +x <file-name> or DIR
In above command x will be added to all the groups - user, group as well as others
If you want to add +x to a specific group , it can be done like --> chmod u+x <file-name> OR chmod g+x <file-name> OR chmod o+x <file-name>

eg -->>> chmod g+rwx <file-name>
chmod u-rw <file-name>

# chmod 770 <file-name> means giving all permissions to user, group and removing all permissions to others
??? (user/group/other), 777 means - 7 for usr (rwx), 7 for group (rwx) and 7 for other (rwx)

# chmod 400 <Dicectory-name>  --> all files /directories permissions inside the folder will have permissions changes to 400
# -R can also be used with above command , but it is not advised 

3) chown commmand

This command is used to change the ownership of the user that owns the file or directory 
sudo chown -R <new-user> <FileorDir>

we can see under home directory types of users

sudo chown -R <new-user>:<new-group> <File or Dir>/

also if you use : and don't specify the group - it will default to the users group


***************************FIND COMMAND******************************************************************************************

1) find <path-to-start-the-search> -name *.txt 
The above command is used to find the names of the files at a specified path and look for files whose name ends with .txt 

eg - find . -name Documents

find . -name Documents -type d     (d is for directory and f is for file)

Suppose i want to change the permissions of all files inside pictures directory 

chmod - R 600 Pictures 
now it will mess everything up and I won't be able to move inside Pictures directory

chmod -R u+x Pictures
For directory we need the execute permission to go inside

Now all my Pictures will also have excute permissions, but i don't want that 

# with the help of find command we can do above thing properly 

Command is > file Pictures/ -type f -exec chmod 600 {} +                  ({} means for loop and + is used to terminate the command)

It will change all the permissions of the files inside the dir of pictures recrusively 

2) sudo find /var/log -type f -name *.log

If i want to clear this log files, meaning reduce the size to zero - i can use the following command-->
# sudo find /var/log -type f -name *.log -exec truncate -s 0 {} + 

#truncate command is used to reduce the size of a file to a specific one

we can use find commmand and then add those to a file , eg --> find . -name *.mp3 > harkirat-songs.mp3


*************************************systemd-using the systemctl command******************************************

* Installing apache on ubuntu - package name is apache2 and in case of fedora it is httpd
* APACHE is a service which can be managed by systemd
- type local host in the browser and you will be landed to a apache2 server page

* systemd refers to services as units
* systemctl is used to manage services on the machines

# systemctl status apache2       #apache2 is the unit name
this will show the output of the apache2 service

If you want to start a unit, you need to enable it first -> sudo systemctl enable <unit-name> && sudo systemctl start <unit-name>

In case of fedora it won't run, so we need to add firewall commmand ->  sudo firewall-cmd --zone=public --permanent --add-service=http

# enable and start a unit in same command ---> sudo systemctl enable --now httpd(unit-name)

---running a unit for a specific server----
1) sudo apt install syncthing
2) sudo systemctl status syncthing ---> will result in no output
3) sudo systemctl status syncthing@<user> -- will show the status
4) sudo systemctl enable --now syncthing@<user>

## Learn about synchthing , also it runs on http://localhost:8384/

Going inside the file -> cd /usr/lib/systemd/system
It will list down the services and will have syncthing@.service

# systemctl list-unit-files --type=service
It will list the services in a decent manner , vendor_preset disabled means - we need to manually enabled the utility upon package installation 

# sudo systemctl restart httpd (this is done when we change the config file for a unit) 
reload can also be used sometimes and is benefecial 

#tmux is used to flip between servers  learnnnnnnnnnnnnn
