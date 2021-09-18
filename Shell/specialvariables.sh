#!/bin/bash
#PURPOSE: To learn special variables 
#Created Date Sat 18 Sep 12:34:55 IST 2021
#Created By: Harkirat Singh
#START OF CODE
echo '$* means' "'$*': it captures the entire value as a string and gives output as $*"
echo '$# means' "'$#': total no of positional arguments specified are $#"
echo '$1 and $2 means' "'$1' '$2' :are the positional arguments passed as $1 !!! $2"
echo '$0 means' "'$0': your current programme name is $0"
echo '$@ means' "'$@': each string is treated as a separate argument and output is $@"
echo '$? means' "'$?': exit status of last command is $?" ',,,,,,if exit status is 0 means command is succesful'
echo '$$ means' "'$$': PID of current shell is $$"
sleep 2 &
echo '$! means' "'$!': PID of last background job is $!" 'we ran sleep command in above line and this gives PID'









#END OF CODE
