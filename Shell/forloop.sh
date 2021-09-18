#!/bin/bash
#PURPOSE: Learning for loop
#Created Date Sat 18 Sep 23:08:10 IST 2021
#Created By: Harkirat Singh
#START OF CODE

# create a hostfile for this example and we can use that file to iterate

for i in `cat hostfile`
do 
ping -c 1 $i
resp=`echo $?`
if [ $resp -ge 1 ]; then
echo "$i - host is not responsive"
echo "**********ERROR***********"
else 
echo "$i host is up"
echo "****SUCCESS*************"
fi
done
#END OF CODE

# we can also append the output of ping -c 1 $i to a diff file so as to reduce the chaos on the screem