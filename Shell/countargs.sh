#!/bin/bash
#PURPOSE: Counting given positional parameters 
#Created Date Sat 18 Sep 13:07:13 IST 2021
#Created By: Harkirat Singh
#START OF CODE

# echo "The no of arguments passed to the shell script are --- > $#"
# adding some conditional

if [ $# -lt 1 ];then
echo "program usage is like './scriptname.sh' options"
else
echo "the no of arguments given are $#"
fi
#END OF CODE
