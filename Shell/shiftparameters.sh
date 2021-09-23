#!/bin/bash
#PURPOSE: Shifting positional parameters automatically
#Created Date Sun 19 Sep 01:33:32 IST 2021
#Created By: Harkirat Singh
#START OF CODE
set `date`
echo "The values are $1 $2 $3 $4"
echo "actual value is `date`"
shift 
echo "after running shift operation"
echo "The values are $1 $2 $3 $4"
shift 
echo "after running shift operation"
echo "The values are $1 $2 $3 $4"
shift 
echo "after running shift operation"
echo "The values are $1 $2 $3 $4"
shift 
echo "after running shift operation"
echo "The values are $1 $2 $3 $4"


#END OF CODE
