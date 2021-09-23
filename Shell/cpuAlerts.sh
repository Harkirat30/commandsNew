#!/bin/bash
#PURPOSE: Real time CPU utiisation Monitoring
#Created Date Sun 19 Sep 20:56:49 IST 2021
#Created By: Harkirat Singh
#START OF CODE

HOSTNAME=$(hostname)
CRITICAL=98
WARNING=90

email="harkirat.singh@traydstream.com"

mkdir -p /var/log/cpuUtilHistory
logfile=/var/log/cpuUtilHistory/cpuusage-`date +%h%d%y`.log

#END OF CODE
