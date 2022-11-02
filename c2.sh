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
#otherwise we are printing what is in the file.

#XXXXXXX-------XXXXXXXXXX--------XXXXXXXXXXXX--------XXXXXXXXXXXX----------XXXXXXXXXXXXX---------XXXXXXXXX---------

file=$1
id=0
ck=0
while read -rN1 c ; do
    
    if [[ $c == '"' && $id == 0 ]]
    then
     if [[ $ck == 0 ]]
      then
       ck=1
     else 
      ck=0
    fi
    fi
    if [[ $c == '/' && $id == 0 && $ck == 0 ]]; then #checking first /
        id=1
        continue
    fi

        if [[ $c == '*' && $id == 1 ]]; then #for starting of multiline comment
        id=3
        continue
    fi
     
     if [[ $c != '/' && $id == 1 ]]
     then
     id=0
     printf  "/%s" "$c"
     continue
     fi     
    if [[ $c == '/' && $id == 1 ]]; then #checking second / for singel line comment
        id=2
        continue #continue without printing
    fi


    if [[ $c == '*' && $id == 3 ]]; then
        id=4
        continue
    fi

    if [[ $c == '/' && $id == 4 ]]; then  #ending of multiline comment
        id=0  
        continue
    fi #cloasing  if else block

    if [[ $c == $'\n' && $id == 2 ]]; then #if encounters new line
        id=0
        printf '\n'
        continue
    fi

    if [[ $id == 0 || $id == 1 ]]; then
        
        printf "%s" "$c" #actual printing process in terminal
    fi
done < $file