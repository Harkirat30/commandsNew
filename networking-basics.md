
**************************************************************************
NETWORKING BASICS

what is a URI -->>anything after .com/

eg- URL -->> http://www.ngig.nlm.nih.gov/VecSecreen/Secscreen.html

It represents --> protocol://FiftLevelDomain.4thLevel.3rdlevel.Domain(Frst+second)/DirectoryName/FileName

* www.ngig.nlm.nih.gov --This is host

* IPV4 can be assigned from 1.1.1.1 to 255.255.255.255 and we are running out of IPV4 addresses

**Solution to solve this problem -->> NAT**

*IP addresses that the router in your home will asiign to your device begins with 192.168.something.something and of router is 192.168.0.something (internal address)

*roter also has an external IP address which it uses to communicate with internet (it is called ISP IP address)

*Also on every computer you see one IP address -->> 127.0.0.1  - It basiclly meams this computer , when you type it in your browser - u see local   host (Apache2 Ubuntu Default Page)
*Similarly the 192.168.. address works the same


***IFCONFIG** command in linux , in windows it is ipconfig

**loopback** will have address 127.0.0.1

**wlp **- wireless internet , RX bytes is the one which you receive, and TX is the ones you transfer out , It will also have an ipv6 addresss 
           inet 192.168.1.8  netmask 255.255.255.0  broadcast 192.168.1.255
           inet6 fe80::e3b2:ab1e:9ddb:2138  prefixlen 64  scopeid 0x20<link>

inet address will be the NAT addresd 

**Next command is tcpdump**

1) sudo apt-get install tcpdump

sudo tcpdump --->>> This command captures all the packets coming in and out of my computer

tcpdump -c 10  ->> in order to capture small amount (Captures 10 packets)

sudo tcpdump -c 10 -A --->> Command to see the packets coming through 

sudo tcpdump -c 10 -i wlp2s0 (-i is to enter the device name and that we get by running the command ifconfig)

-i means it tells it to run a specific interface 

# capturing packets from specific ports

sudo tcpdump -i wlp2s0 port 22

NETSTAT (Network Statistics) commands -->>>

1) netstat -nr (n will give you the IP addresses rather than the domain names,,, -r means we are looking for kernel IP routing table entries)
2) netstat -i (it shows us the usage of our devices --> these are the ones we get in ifconfig command ---> docker0, localhost (lo), wlp2s0, enp1s0 
3) netstat -ta (this will look for active sockets, will print out foreign and local adddress) 
4) netstat -tan (will show IP addresses instead of host names 


# checking for open ports

1) netstat -antplF ---->> The coloumn which says local address, is appended by the port number which is open , STATE --LISTEN means open 
if it says 127.0.0.1:53 -- it means the port 53 can be acccessed locally 
but if it says 0.0.0.0:22 --> it means the port 22 can be accessed from anywhere i.e outside the local machine also 

2) using nmap 

command --> nmap -open 192.168.1.8  (this is for wlp2s0 wireless device)

also for local host -->> nmap -open 127.0.0.1

NMAP only shows open ports which can be acccessed from outside


HOSTS

hosts file is in /etc/hosts
like DNS server holds the records of what domain points to what IP addresses 
so you can say /etc/hosts file is the internal DNS lookup functionality 

So when you type in a server address, it looks at hosts file, then goes to router and from that goes to the internet if it doesn't find it 

eg- from network-tools.com - type server name, grab IP address and add value in /etc/hosts file --- in order -->>>   IP Name Alias 
so you can set googe IP address to any name u want >> ip googly.com googlll
and it will work


So basically u can create shortcuts for your favorite websites with exvception of google, as there is lot of internal routing and stuff

myhostname i.e the machine name will also route to the default local host and give me the apache page

Changing hostname for Ubuntu --

1) sudo hostnamectl set-hostname <new-name>
2) sudo vi /etc/hosts
add entry -->> 127.0.0.1 <new-name>  (basically we are updating the hostname)
3) sudo service hostname restart 


TRACEROUTE 

Install it --> sudo apt-get install traceroute 

1) Command --> traceroute google.com (domain you want to trace the route to)
This will display every server the requests jumps to in order to get to google.com
*** means request is timed out on a sever so it is going to route to another one 
 
NMAP (network mapper)

nmap <IP>

IP we can get of individual device by using ifconfig

Service http - port 80 is the apache service

For more info we can run nmap -v <IP>   (-v is the verbose mode)

my router address --- >>>192.168.1.1

nmap 192.168.1.8,1  (this command scans multiple IP addresses - we are scanning for router and my local)

output--------------------------------------------------------------------------------
Starting Nmap 7.80 ( https://nmap.org ) at 2021-06-09 21:35 IST
Nmap scan report for _gateway (192.168.1.1)
Host is up (0.0040s latency).
Not shown: 996 closed ports
PORT    STATE    SERVICE
23/tcp  filtered telnet
53/tcp  open     domain
80/tcp  open     http
443/tcp open     https

Nmap scan report for ts-india-0032 (192.168.1.8)
Host is up (0.000044s latency).
Not shown: 997 closed ports
PORT     STATE SERVICE
22/tcp   open  ssh
80/tcp   open  http
8080/tcp open  http-proxy

Nmap done: 2 IP addresses (2 hosts up) scanned in 3.08 seconds

------------------------------------------------------------------------------------------------

We can also scan a range of IP addresses -->> nmap 192.168.0.1-100

We can also scan external IP addresses or host names 

nmap google.com









































