#!/bin/bash

echo -e 'Enter the name of file to be created: \c'
read -r file
echo `date -u` "A file with a name $file will be created at specified timestamp at a given time"
touch $PWD/$file.sh
echo '#!/bin/bash' > $PWD/$file.sh                  #first time adding something can be done by a single >
echo '#PURPOSE:' >> $PWD/$file.sh
echo '#Created Date' `date` >> $PWD/$file.sh
echo '#Created By: Harkirat Singh' >> $PWD/$file.sh
echo '#START OF CODE' >> $PWD/$file.sh
echo '#END OF CODE' >> $PWD/$file.sh
