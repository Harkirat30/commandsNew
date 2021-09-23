******************************************************
Learning shell with good syntax

Sept 12,2021

*********************************************************

1) to see types of shell --> cat /etc/shells
2) Aliases can't be created on sh shell but can be created on bash
3) sh won't store command line history, but bash can store

4) echo by itself displays a line of text. It will take any thing within the following "..." two quotation marks, literally, and just print out as it is. However with echo -e you're making echo to enable interpret backslash escapes. So with this in mind here are some examples

INPUT: echo "abc\n def \nghi" 
OUTPUT:abc\n def \nghi

INPUT: echo -e "abc\n def \nghi"
OUTPUT:abc
 def 
ghi

5) \n means new line and \t means tab
6) echo -e 'Enter the name of file to be created: \c'
Above command will ask for an input and have the cersor on the same line

7) Read command
read --help
read -r : do not allow backslashes to escape any characters

8) Adding a code in a single line -->
   echo "what is your name..?";read name;echo "hello $name"

# after read we add variable name -->> read name (name is a variable of choice)

9) Adding some content to a file use single quotes

echo 'Adding text' >> file.sh

# quotes meanings "" '' ``

10) adding a script called quotes, using the template.sh file
Output of quotes.sh command is :
testing double quotes - Name of person is Harkirat and age is 27
testing single quotes Name of person is $var and age is $age
value of calendar is    September 2021     
Su Mo Tu We Th Fr Sa  
          1  2  3  4  
 5  6  7  8  9 10 11  
12 13 14 15 16 17 18  
19 20 21 22 23 24 25  
26 27 28 29 30

for "" both variables get executed
for '' both variables get printed as is , even special characters would be printed as is
for `` we can run a command

# variables
11) Creating a variable.sh using template.sh

NOte: variables should not start with a number, can have underscores, cannot have special characters

# special Variables 

1) $* - It stores the complete set of positional arguments as a single string
2) $# - It is set to the number of arguments specified
3) $1 - first argument
4) $2 - second argument
5) $0 - name of executed command  
6) "$@" - each quoted string treated as a separate argument
7) $? - exit status of last command  , ->note : if command is executed successfully, it will give 0 value  **(exit code status lie between 0-255)**
8) $$ - PID of current shell
9) $! - PID of last background job

Running script as --> sh specialvariables.sh harkirat singh is my name and i am learning shell

NOTE: with echo -e , the back escape characters are given special meaning 

# Sub shell 

syntax -->>  $(( ))

- `expr $a \* $b`" , * has to be escaped as it as a diff meaning in shell script 

# relational operators 

1) -lt means less than       OR     >
2) -le means less than or equal to    OR =>
3) -gt means greater than       OR   <
4) -ge means greater than or equal to  OR <=
5) -eq means equal to         OR   =
6) -ne means not equal to     OR !=

# test command
1) test 5 -gt 2 && echo "Yes"
2) test condition && true-command || false-command
3) test condition || false-command
4) test condition && true-command

# logical operators
# to write multiple conditions, validate multiple conditions and execute the statament 

1) AND   -->>> (-a) (&&)
2) OR    -->>> (-o) ||
3) NOT   -->>> (-n) !

# if statement 

Note: touch test{1..100}.txt will create 100 files 
starting from test1.txt to test100.txt

Syntax:

if [ expression ]
then
   statement
fi

OR 
if [ expression ]; then
   statement
fi

# if el if statement 
if [ expression 1 ]
then
   Statement(s) to be executed if expression 1 is true
elif [ expression 2 ]
then
   Statement(s) to be executed if expression 2 is true
elif [ expression 3 ]
then
   Statement(s) to be executed if expression 3 is true
else
   Statement(s) to be executed if no expression is true
fi

# nested if statements
a=3

if [ "$a" -gt 0 ]
then
  if [ "$a" -lt 5 ]
  then
    echo "The value of \"a\" lies somewhere between 0 and 5."
  fi
fi

# while loop syntax
while command
do
   Statement(s) to be executed if command is true
done

# for loop syntax

for var in word1 word2 ...wordn
do
   Statement to be executed
done

11) ping -c 1 (count)
    c is for count and ping is above command is used to ping one time

# case statement syntax
case word in
   pattern1)
      Statement(s) to be executed if pattern1 matches
      ;;
   pattern2)
      Statement(s) to be executed if pattern2 matches
      ;;
   pattern3)
      Statement(s) to be executed if pattern3 matches
      ;;
   *)
     Default condition to be executed
     ;;
esac

# continue statement 

while something
do 
   condition
         cmd1
         cmd2
do want to continue
done


Continue statement can be utilised with any loop

if Continue statement is satisfied it moves up the loop again
Continue statements is used to do repeated tasks again and again

# set command
A single set command can be used to set many variables, but such a use is not recommended. set is for setting shell variables, which do not propagate to child shells. To propagate to a child shell, use environment variables. A child shell would be created when a new shell is started, such as when running a script.

Set inbuilt bash features assign the positional arguments to a script

# set command assigns the positional parameters 

# shift in built bash features

Shift transfers the contents of a positional parameter to its immediate lower numbered position, this is done as many time as the statement is called 

shift 3
it will shift 3 parameters

# functions
Functions compute a value and returns a value at a given time
A larger script can be divided into multiple functions and that functions can be called as many times as u want anywhere in the script

SYNTAX:

function name (){
Statements
Values
}

name                # this means we are calling function


1) basename command
basename /home/harkirat30/Documents/Harkirat-GIT/commandsNew/git.md
output will be -> git.md

2) man test
   -f FILE means file exist and is a regular file

if [ -f $file ]; then  (this will check if $file exist or not)

3) date +%F - It gives 2021-09-19 answer
4) "/home/harkirat30/$(basename ${1}).$(date +%F).$$" 
   see the brackets and syntax {}

# until loop 

until command
do
   Statement(s) to be executed until command is true
done

-- Until loop executes the statement based on the false impression

# arrays

1) Korn and bash shell supports one dimensional arrays
2) In python we call them as lists
3) eg - > Month=(0 1 3 4 2)
          echo ${Month[0]}   #0
          echo ${Month[1]}   #1
          echo $(Month[@])   #0 1 3 4 2
          echo $(#Month[@])  $5 (counts no of elements)
4) fruits=( "Apple" "Banana" "Pineapple" "Potato" )
   fruits[1]='Waterme lon'      #note single quotes
   Arrays are mutable


# Working with flags - Getopts

getopts is a very convenient bash script utility, which helps you to conveniently and gracefully handle the passing of flags(short version), and arguments in a clean, standardized manner. Instead of having the developer manually handle the flags passed to a script, this provides a handy way of handling this when iterating through a while loop


# monitoring CPU utilisation










# awk command
