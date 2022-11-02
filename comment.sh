#!/bin/bash

#XXXXXX-------XXXXXXXXXX--------XXXXXXXXXXXX--------XXXXXXXXXXXX----------XXXXXXXXXXXXX---------XXXXXXXXX---------
#Name-Trishit Kundu Roll-1928327

#Algorithm && Program Description:-

#This program removes the comments from a c file.
#We know there are two types of comments  :- single and  multiline comments. 
#The single line comment is denoted by //Statement and the multliline  comment consists of /* Statements */
#Now we are taking the c file as input from command line and reading one by one character from the file. 
#We are checking if we get / then we are looking for * or / if / found it is single line comment as //
#if we find * then it is starting of multiline comment. 
#For single line comment we delete(i.e. continue while printing in terminal) the line and for 
#multiline comment we continue to delete the (i.e omit while printing using continue)lines until we found */ .
#otherwise we are printing what is in the file including what is their in printf.
#All characters inside printf will be printed as it is.

#XXXXXXX-------XXXXXXXXXX--------XXXXXXXXXXXX--------XXXXXXXXXXXX----------XXXXXXXXXXXXX---------XXXXXXXXX---------

file=$1             #taking input from command line
id=0
br=0
while read -r -N1 c             #reading characters from file
do
    if [[ $c == '"' && $id == 0 ]]      #checking for " " and printing all special characters inside it
    then
        if [[ $br == 0 ]]
        then
        br=1
            else 
        br=0
        fi
    fi
    
    if [[ $c == '/' && $id == 0 && $br == 0 ]]  #checking for single or multiline comments
    then 
    id=1
        continue
    fi

    if [[ $c == '*' && $id == 1 ]]      #Starting of multiline comment 
    then 
    id=3
        continue
    fi
     
    if [[ $c != '/' && $id == 1 ]]      #checking for characters after single comment
    then
    id=0
    printf  "/%s" "$c"
        continue
    fi     

    if [[ $c == '/' && $id == 1 ]]          #checking for end of single line comment      
    then 
    id=2
        continue                            #skip without printing
    fi

    if [[ $c == '*' && $id == 3 ]]             #checking for end of multi line comments
    then
    id=4
        continue
    fi

    if [[ $c == '/' && $id == 4 ]]          #ending of multiline comments 
    then  
    id=0  
        continue
    fi                                             #closing  if else block

    if [[ $c == $'\n' && $id == 2 ]] 
    then                                       #checking for new line
    id=0
    printf '\n'
        continue
    fi

    if [[ $id == 0 || $id == 1 ]] 
    then
        printf "%s" "$c"                    #Printing in terminal
    fi
done < $file                            #redirecting input from file.