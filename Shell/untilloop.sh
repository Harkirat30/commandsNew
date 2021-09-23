#!/bin/bash
#PURPOSE: until loop example for host ping
#Created Date Sun 19 Sep 19:54:03 IST 2021
#Created By: Harkirat Singh
#START OF CODE

echo -e "Enter Ip address to be pinged : \c"
read -r Ip

until ping -c 3 $Ip 
do 
     
echo "The host $Ip is still down"
sleep 1
done

echo "The host $Ip is up"
#END OF CODE
