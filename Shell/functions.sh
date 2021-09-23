#!/bin/bash
#PURPOSE: function example taking backup of a paticular file
#Created Date Sun 19 Sep 01:42:17 IST 2021
#Created By: Harkirat Singh
#START OF CODE

function takebackup () {
    if [ -f $1 ]; then 
    backup="/home/harkirat30/$(basename ${1}).$(date +%F).$$"
    echo "Backup will be done for $1 at $backup place"
    cp $1 $backup
    fi
}

takebackup /etc/hosts
    if [ $? -eq 0 ]; then
    echo "Backup is successful"
    fi

#END OF CODE
