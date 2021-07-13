After creating the repo run the following commands--
**git config --global user.name "Harkirat Singh"**
**git config --global user.email "harkiratsingh200@gmail.com"**

After this you can check config in cat~/.gitconfig 

we can do git diff <filename> to see what changes have been made to the file

*************************************

Pre-requisite - (git checkout master and git pull origin master )
1- Creating a new branch develop : **git checkout -b develop** (This will create a new branch from develop)
2- Merging with origin and making it up to date - git push origin develop 
# above command will merge all things to the previous branch we are in - that is master
3- git add - this stages your changes for commiting
4- git commit - this commits your staged changes locally
5- git push - this push your commited changes to remote 
6- git reset HEAD^ --soft  (Save you changes ,back to last commit)   - done when Your branch is ahead of 'origin/master' by 1 commit
7- git reset HEAD^ --hard  ( Discard your changes , back to last commmit)
8- git diff command compares staging area and Working directory
9- git checkout command discards changes in working area 


*******************************
-----------Key points---------------------------
1- # Remember: Taking the latest of develop is important before creating the branch
2- Feature branch characteristic - When starting development of a feature, the target 
release in which this feature will be incorporated may well be unknown at that point
3- Feature branch exixts as long as it is in Development , finally it's merged into develop and then destroyed
4- Feature branch does not exist in BitBucket
5- git log --oneline : To see commit's 




git config user.name "Author Name"
git config user.email "author@email.com"

