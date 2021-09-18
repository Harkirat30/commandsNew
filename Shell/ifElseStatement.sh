#!/bin/bash
#PURPOSE: Testing f else statement
#Created Date Sat 18 Sep 15:54:40 IST 2021
#Created By: Harkirat Singh
#START OF CODE

if [ $1 -gt $2 ]
then
echo "test passed as enter first argument is greater than second"
else 
echo "first argument is less than or equal to second"
fi

echo "This script uses positional arguments passed via command line"

#END OF CODE
