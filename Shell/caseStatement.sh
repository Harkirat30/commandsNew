#!/bin/bash
#PURPOSE: learn case statemnt
#Created Date Sat 18 Sep 23:33:44 IST 2021
#Created By: Harkirat Singh
#START OF CODE
echo -e "Please enter 2 numbers separated by space: \c"
read -r num1 num2

echo "1. We will subtract $num1 and $num2"
echo "2. We will divide $num1 and $num2 using 'num1/num2'"
echo "3. We will add $num1 and $num2"
echo "4. We will multiply $num1 and $num2 using 'num1*num2'"
echo "5. We will modulo divide $num1 and $num2 using 'num1%num2'"

echo -e "Enter choice number please -->> \c"
read -r choice

case $choice in
   1) echo "Upon subtracting we get `expr $num1 - $num2`";;
   2) echo "Upon dividing we get `expr $num1 / $num2`";;
   3) echo "Upon adding we get `expr $num1 + $num2`";;
   4) echo "Upon multiply we get `expr $num1 \* $num2`";;
   5) echo "Upon modulo divide we get `expr $num1 % $num2`";; 
   *) echo "Please choose between given 1-5 options";;
esac
#END OF CODE

