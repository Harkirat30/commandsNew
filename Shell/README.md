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
