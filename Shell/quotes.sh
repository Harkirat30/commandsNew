#!/bin/bash
#PURPOSE: Identifying diff between various quotes types "" '' ``
#Created Date Sun 12 Sep 23:17:36 IST 2021
#Created By: Harkirat Singh
#START OF CODE

var=Harkirat
age=27

# testing double quotes
echo "testing double quotes - Name of person is $var and age is $age"
# testing single quotes
echo ' testing single quotes Name of person is $var and age is $age'
# testing reverse quotes
echo "value of calendar is `cal`"

#END OF CODE
