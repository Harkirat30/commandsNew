#!/bin/bash
#PURPOSE: Learnig while loop , printing any given number table
#Created Date Sat 18 Sep 22:59:49 IST 2021
#Created By: Harkirat Singh
#START OF CODE
echo -e "enter the number : \c"
read -r num1

while [ $num1 -le 20 ]
do
echo "Entered value is $num1 which is less than 20"
echo "now we will keep on incrementing and printing the values of num1"
num1=`expr $num1 + 1`
echo "Incremented value is $num1"
done
#END OF CODE
