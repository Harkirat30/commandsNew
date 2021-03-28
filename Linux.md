Description: Things learned in Mongo 
author: "Harkirat Singh"
Date: "Mar-28,2021"

**************************************************************************************
# Ports, ports commands and adding DNS entry in /etc/hosts for Minkikube Ingress

port *80* is for http and *443* is for https traffic
ssh - 22 
Command -->>> *netstat -n* {to see the active connections}
Command ->>>> *netstat -a -b -n* 
command -->> *tee* --- used to send output to a file as well as standard out.. Meaning you won't have to write 2 commands , tee can be used 
*-a* flag can be used if you want tee to append to a file 
EXAMPLE --------------------->>>>>>>>>>>>>>>>   *echo "$(minikube ip) harkirat-singh.com" | sudo tee -a /etc/hosts*


