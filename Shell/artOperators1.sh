#!/bin/bash
#PURPOSE: Different ways of using artOperators using expr command
#Created Date Sat 18 Sep 14:01:22 IST 2021
#Created By: Harkirat Singh
#START OF CODE
echo -e "enter the first value: \c"
read -r a 
echo -e "enter the second value: \c"
read -r b 
echo "Entered variables a and b are $a and $b respectively"
echo "a+b is `expr $a + $b`"
echo "a-b is `expr $a - $b`"
echo "axb is `expr $a \* $b`"
echo "a/b is `expr $a / $b`"
echo "a%b is `expr $a % $b`"
#END OF CODE
