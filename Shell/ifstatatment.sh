#!/bin/bash
#PURPOSE: Testing if statement example
#Created Date Sat 18 Sep 15:44:44 IST 2021
#Created By: Harkirat Singh
#START OF CODE
echo -e "enter the value: \c"
read -r value
if [ $value -ge 10 ]
then
echo "entered value is greater than 10"
touch /tmp/test{1..8}.txt
echo "script completed successfully"
fi
#END OF CODE

