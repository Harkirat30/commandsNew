#!/bin/bash
#PURPOSE: learning nested if statements , validate nd support student marks
#Created Date Sat 18 Sep 17:07:20 IST 2021
#Created By: Harkirat Singh
#START OF CODE
echo -e "please enter physics chemistry and maths marks by space: \c"
read -r p c m 
if [ $p -gt 35 -a $c -gt 35 -a $m -gt 35 ]; then
total=`expr $p + $c + $m`
average=`expr $total / 3`
echo "Total marks is $total"
echo "Average marks is $average"
    if [ $average -ge 75 ]; then
    echo "congrats u got more than 75 percent marks"
    elif [ $average -ge 60 -a $average -lt 75 ]; then
    echo "congrats u passed and got between 60 and 75"
    elif [ $average -ge 40 -a $average -le 60 ]; then
    echo "congrats u barely passed and got between 40 and 60"
    fi
else 
echo "you got less than 40 and u fail Sorry"
fi
#END OF CODE
