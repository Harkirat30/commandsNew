#!/bin/bash
#PURPOSE: To test logical operators/bollean operators, student marks validation
#Created Date Sat 18 Sep 14:24:21 IST 2021
#Created By: Harkirat Singh
#START OF CODE

echo -e "enter the physics marks: \c"
read -r p 
echo -e "enter the maths marks: \c"
read -r m 
echo -e "enter the chemistry marks: \c"
read -r c

if test $p -ge 35 -a $c -ge 35 -a $m -ge 35
then
echo "you have passed in the examination and scored -ge 35 in all"
else
echo "you have not passed in the examination and scored -lt 35 in atleast one"
fi
#END OF CODE
