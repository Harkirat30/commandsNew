#!/bin/bash
#PURPOSE: 
#Created Date Sat 18 Sep 14:09:58 IST 2021
#Created By: Harkirat Singh
#START OF CODE

echo -e "Please provide first number: \c"
read -r a 
echo -e "Please provide second number: \c"
read -r b
echo "entered numbers are $a and $b"
echo "see readme for test command"

test $a -lt $b;echo "$?";
test $a -le $b;echo "$?";
test $a -gt $b;echo "$?";
test $a -ge $b;echo "$?";
test $a -eq $b;echo "$?";
test $a -ne $b;echo "$?";
echo "true conditions print exit status $? as 0 and rest will print diff"


#END OF CODE
