#!/bin/bash
#PURPOSE: testing ifelif statement , finding biggest number among 4 digits
#Created Date Sat 18 Sep 16:01:23 IST 2021
#Created By: Harkirat Singh
#START OF CODE
echo -e "enter 4 numbers one by one followed by space: \c"
read -r a b c d

if [ $a -gt $b -a $a -gt $c -a $c -gt $d ]
then
echo "value a is greatest"
elif [ $b -gt $c -a $b -gt $d ]
then 
echo "b is greatest"
elif [ $c -gt $d ]
then 
echo "c is greatest"
else
echo "d is greatest"
fi