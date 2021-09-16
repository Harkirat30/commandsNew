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



NOTE:: After adding the public key in the bit bucket repo - > make sure you run command -->>> git config credential.helper store 
and then it will automatically do the deed

# diff between git pull and git fetch 

# rebase command in git 


************************************GIT INTERVIEW QUESTIONS****************************************************************************

1) what is a distributes VCS (version control system)
these are the systems which don't rely on a central server to store a project file and all it's versions 
2) git is a descentralised VCS and SVN is a centralised one
3) Git is fast and uses C language

4) Various git repository hosting functions -> Github, Gitlab, BitBucket, GitEnterprise
5) Working dir has .git folder (it has all history) and other contents 

6) fixing broken commit  by using --> git commit --amend 

7) what causes a conflict in git --> when 2 separate branches have made edits to the same line in a file or when a file has been deleted in one branch but has been edited in the other branch 

8) how to revert a commit which has already been pushed and made public 

first approach -> fix the file and then re-commit it with new changes
second approach -> we can undo the changes by using git revert command--->>> git revert commit-id

9) git pull and git fetch command

git pull = git fetch + git merge 

**so git pull command pulls new changes or commits from a paticular branch from your central repository and updates your target branch in your local repository ,
whereas git fetch is used for same purpose but works in a diff way- git fetch pulls all new commits from the desired branch and stores it in a new branch in your local repo , if you want to reflect the changes in your target branch - git fetch must be followed by a git merge.**

# git fetch won't make the changes in the local branch that we are working on , but git pull will do that 

10) when you add the changes they are moved to the staging area,
commmand to remove changes from staging area - > git restore --staged <file-name> or .
command to remove the changes after commiting and move them to staging --> git reset --soft HEAD~1
command to remove the changes after commiting and also remove them from working area --> git reset --hard HEAD~1

11) WHat is git stash

If you want to switch branches and don't want to do a commit of half done work, you can do this by using git stash

>STashing takes your working directory that is your modified tracked files and staged changes and saves it on a stack of unfinished changes that you can re-apply any time
>git stash apply command is used to bring back the saved changes onto your current working directory 

12) what work is restored when the deleted branch is restored ?
The files which were stashed and saved in the stash index will be recovered back. Untracked files would be lost.

13) git status and git diff

git diff depicts the changes between commits, commit and working tree (what changes we have made to the file) 
whereas git status shows diff netween working directory and index


1)  how to check if a branch has been merged into master

git branch --merged
git branch --no-merged 

15) git hook ?
The directory consists of shell scripts that are activated if you run coresponding git commands

16) rebase command is an alternate to the merge command - diff is that rebase writes the commit history 
