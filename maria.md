
1) Command to get a Maria dump

kubectl exec <pod-name> -- mysqldump -u <username> -p GTX_CC > GTX_CC.sql    (DatabaseName > EztractedDumpName)

        OR
mysql -u maria_admin -p GTX_CC --protocol=TCP<2020-09-24-GTX_CC.sql

2) Taring a file

tar -cvzf <Tar-name>.tar.xz <file-name-to-be-tar>

tar -cvzf GTX_CC.sql.tar.xz GTX_CC.sql

