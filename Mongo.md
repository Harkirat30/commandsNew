Description: Things learned in Mongo 
author: "Harkirat Singh"
Date: "Mar-28,2021"

************************************************************************************************

***Creating a user inside Mongo container***
db.createUser({ user: "nfr", pwd: "cUtF3Mk7s%40RY8%2ADAv3z",roles:["userAdminAnyDatabase", "dbAdminAnyDatabase", "readWriteAnyDatabase"], mechanisms:["SCRAM-SHA-1"]})

**Cloud ATLAS**
A connection string is required to be passed as a URL so that containers can connect with Mongo Atlas , once the Cluster creation is complete in Mongo Atlas

*Debugging from the container in Cloud Atlas*

python3
from pymongo import MongoClient







************************************
## restoring mongo and Maria DB
## Restore Maria 
kubectl cp /home/harkirat30/Desktop/Traydstream/Repo/Dev/gtx-db/data/mariadb/restore/gtx-db/ $pod_db:/tmp/M/
 mysql -u root -p
 Enter password (You would be able to find the password in Maria)
 create database GTX_CC;
 use GTX_CC;
 source /tmp/M/gtx-db.sql
 exit
 exit

## restoring mongo - REF_DATA and TEMPLATE_DATA


kubectl cp /home/harkirat30/Desktop/Traydstream/Repo/Dev/gtx-db/data/mongodb/restore/ref_data/ $pod_mongo:/tmp/R/
kubectl cp /home/harkirat30/Desktop/Traydstream/Repo/Dev/gtx-db/data/mongodb/restore/TEMPLATE_DATA/ $pod_mongo:/tmp/T/

##kubectl exec $pod_mongo -- bash -c "cd tmp/T/ && mongorestore . --db TEMPLATE_DATA && cd ../R/ &&  mongorestore . --db REF_DATA"


**************************************************************************************************************
## Specific to Traydstream

Changes made in tsuat and citiuat 

Citiuat - local mongo user, pass and URL changed 

TSuat - cloud atlas , mongo pass and user changed 
Edwy made the changes ---- MONGO_USER: "tsuat_admin"  , MONGO_PASSWORD: "wj6QmPVDARlE7MOI"  ,,
TS_MEMBRANE__MONGO_URL: "mongodb+srv://tsuat_admin:wj6QmPVDARlE7MOI@tsuat.pyju3.mongodb.net/?retryWrites=true&w=majority"     
  FILE_MONGO_URL: "mongodb+srv://tsuat_admin:wj6QmPVDARlE7MOI@tsuat.pyju3.mongodb.net/?retryWrites=true&w=majority"        
  MONGO_URL: "mongodb+srv://tsuat_admin:wj6QmPVDARlE7MOI@tsuat.pyju3.mongodb.net/?retryWrites=true&w=majority"   
  TS_COMMENTS__MONGO_URL: "mongodb+srv://tsuat_admin:wj6QmPVDARlE7MOI@tsuat.pyju3.mongodb.net/?retryWrites=true&w=majority"     
  TS_STAMP__MONGO_URL: "mongodb+srv://tsuat_admin:wj6QmPVDARlE7MOI@tsuat.pyju3.mongodb.net/?retryWrites=true&w=majority"         
  
Citiuat - local mongo

MONGO_USER: "citi-uat"
MONGO_PASSWORD: "citiUat219Traydstream"
TS_MEMBRANE__MONGO_URL: "mongodb://citi-uat:citiUat219Traydstream@gtx-mongo:27017/" 
  FILE_MONGO_URL: "mongodb://citi-uat:citiUat219Traydstream@gtx-mongo:27017/" 
  MONGO_URL: "mongodb://citi-uat:citiUat219Traydstream@gtx-mongo:27017/" 
  
TS_STAMP__MONGO_URL: "mongodb://citi-uat:citiUat219Traydstream@gtx-mongo:27017/"
TS_COMMENTS__MONGO_URL: "mongodb://citi-uat:citiUat219Traydstream@gtx-mongo:27017/"

and manually added a user --->>> db.createUser({ user: "citi-uat", pwd: "citiUat219Traydstream",roles:["userAdminAnyDatabase", "dbAdminAnyDatabase", "readWriteAnyDatabase"], mechanisms:["SCRAM-SHA-1"]})


for mongo atlas - command to restore data 
First we need to copy all the ref and template data 

firstly need to copy everything and then after that need to use the below command to restore to the respective database - REF_DATA or TEMPLATE_DATA 
mongorestore mongodb+srv://tsuat_admin:wj6QmPVDARlE7MOI@tsuat.pyju3.mongodb.net/?retryWrites=true&w=majority .




*********************************************************************************************
*Using Mongo Atlas*

1) pip3 install --user dnspython
2) python3
3) from pymongo import MongoClient
4) client=MongoClient("ConnectionString")
5) client.list_database_names()  - this will list all database names

Note: you should have your Ip white listed and also conection string should have the correct username and password 