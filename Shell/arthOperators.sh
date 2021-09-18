#!/bin/bash
#PURPOSE: To learn all the arithmetic operators
#Created Date Sat 18 Sep 13:18:28 IST 2021
#Created By: Harkirat Singh
#START OF CODE
echo -e "enter the first value: \c"
read -r a 
echo -e "enter the second value: \c"
read -r b 
echo "Entered variables a and b are $a and $b respectively"
echo "a+b is $(( $a+$b ))"
echo "a-b is $(( $a-$b ))"
echo "axb is $(( $a*$b ))"
echo "a/b $(( $a/$b ))"
echo "a%b is $(( $a%$b ))"
#END OF CODE
