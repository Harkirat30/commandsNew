***********************INTERVIEW QUESTIONS FOR SHELL******************************************************************************************

- Shell is a command line interpreter, it translates commands entered by the user and converts them into a language that is understood by the kernel
- shell is a utility that processes your request
- Types of variables in shell scripts :
  1) System variables -> these variables can be viewed by **echo and set** command (these are defined in Capital letters)
  2) User defined variables -> These variables can be viewed by **echo** command
- Types of shells
  1) Bourne shell types - bourne shell, korn shell, bourne-again shell and posix shell
  2) C shell types - C shell, Z shell 

- Super block in shell scripting: It is basically a programme that contains all the information regarding a specific file system , eg -> info about size of the file,the block size used by no of free data blocks

- Stages a linux process passes through- 
  1) Waiting - linux process waits for resource
  2) Running 
  3) Stopped
  4) Zombie : means process has been stopped but still active in process table

- #!/bin/bash or /bin/sh->> Shebang line - significance -> It determines the location of the engine which is used to execute the script
- $1 - is a first variable that you pass in the command line 
  
  Script:

  #! /bin/sh
  cat $1

  cmd-->>> ./sh harkirat.txt
  OUTPUT will be cat of harkirat.txt 

- 