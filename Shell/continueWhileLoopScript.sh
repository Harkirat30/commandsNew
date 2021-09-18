#!/bin/bash
#PURPOSE: Understanding continue statement using while loop
#Created Date Sat 18 Sep 23:52:28 IST 2021
#Created By: Harkirat Singh
#START OF CODE

name='Harkirat'

while [ $name = 'Harkirat' ]
do 
echo -e "enter some number: \c"
read -r num1
if [ $num1 -le 50 ]; then
echo "entered number square is : `expr $num1 \* $num1`"
else 
echo "number entered is not in range"
fi
echo -e "enter a diff name than harkirat if don't want to continue: \c"
read -r values
if [ $values = 'harkirat' ]; then
continue
else
echo "exiting out"
exit
fi
done
#END OF CODE
