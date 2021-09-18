#!/bin/bash
#PURPOSE: Testting logical or operators 
#Created Date Sat 18 Sep 14:35:13 IST 2021
#Created By: Harkirat Singh
#START OF CODE

echo -e "enter first numeric value: \c"
read -r num1
echo -e "enter second numeric value: \c"
read -r num2

if [ $num1 -le 20 -o $num2 -ge 30 ];
then
echo "any of the 2 statements are true"
else
echo "both statements are false" 
fi

#END OF CODE
# Rather than using read we can also use $a and $b