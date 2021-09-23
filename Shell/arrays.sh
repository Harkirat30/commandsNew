#!/bin/bash
#PURPOSE: Array example
#Created Date Sun 19 Sep 20:06:34 IST 2021
#Created By: Harkirat Singh
#START OF CODE

fruits=( "Apple" "Banana" "Pineapple" "Potato" )

for fruit in ${fruits[@]}
do 
echo "Fruit name is $fruit"
done

echo "No of fruits are ${#fruits[@]}"
echo "All fruits are ${fruits[@]}"
echo "*******************************************"
echo "Lets change the Banana to Watermelon"

fruits[1]='Waterme lon'
echo "All fruits are ${fruits[@]}"
echo "No of fruits are ${#fruits[@]}"
#END OF CODE
