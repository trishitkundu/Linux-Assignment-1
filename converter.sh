#!/bin/bash

#XXXXXX-------XXXXXXXXXX--------XXXXXXXXXXXX--------XXXXXXXXXXXX----------XXXXXXXXXXXXX---------XXXXXXXXX---------
#Name-Trishit Kundu Roll-1928327

#Algorithm && Program Description:-

#This is a program of morse to text and text to morse conversion.
#We are taking input of the file from the command line argument and checking the extention of the file
#whether it is .txt file or .morse file .If it is .txt file then we are assigning id=1 if it is morse then
#we are assigning id =2 then using case. We are using case 1 (i.e case $id) to encode it in morse 
#and case 2 (i.e case $ id ) we are decoding the file. 
#In text to morse we are extracting characters from the file and checks with associative array and 
#converting it into respective morse by calling encoding function where after each space putting (/) 
#and after every word putting(//).
#In morse to text we are using the decode function where case of each morse to letter are assigned 
#& converting the morse code letter by letter and printing the text (original) in terminal.


#XXXXXXX-------XXXXXXXXXX--------XXXXXXXXXXXX--------XXXXXXXXXXXX----------XXXXXXXXXXXXX---------XXXXXXXXX---------

encode()
{						#encoding from text to morse function starts 
    declare -A morse	#declaring explicit array
morse[0]='-----'
morse[1]='.----'
morse[2]='..---'
morse[3]='...--'
morse[4]='....-'
morse[5]='.....'
morse[6]='-....'
morse[7]='--...'
morse[8]='---..'
morse[9]='----.'
morse[A]='.-'
morse[B]='-...'
morse[C]='-.-.'
morse[D]='-..'
morse[E]='.'
morse[F]='..-.'
morse[G]='--.'
morse[H]='....'
morse[I]='..'
morse[J]='.---'
morse[K]='-.-'
morse[L]='.-..'
morse[M]='--'
morse[N]='-.'
morse[O]='---'
morse[P]='.--.'
morse[Q]='--.-'
morse[R]='.-.'
morse[S]='...'
morse[T]='-'
morse[U]='..-'
morse[V]='...-'
morse[W]='.--'
morse[X]='-..-'
morse[Y]='-.--'
morse[Z]='--..'
morse[.]='.-.-.-'
morse[,]='--..--'
morse[?]='..--..'
morse[=]='-...-'
while read -r -N1 c;		#reading text from file
 do
	c=${c^}					#changing the text to Uppercase
	if [[ $c == $'\n' ]]	#checking for next line
	then
		printf "//\n"
	elif [[ $c == ' ' ]]	#checking for spaces
	then
		printf '/'

	else
		printf '%s/' "${morse[$c]}"			#printing the morse corresponding to text
	fi
done < $1 > test.morse			#redirecting the input from file and redirecting output to another file
cat test.morse					#printing the file
}								#encoding function ends
decode()
{								#decode from morse to text function starts
check()
{
value=$1
case $value in						
"-----")          echo -n "0";;
".----")        echo -n "1";;
"..---")        echo -n "2";;
"...--")        echo -n "3";;
"....-")        echo -n "4";;
".....")        echo -n "5";;
"-....")        echo -n "6";;
"--...")        echo -n "7";;
"---..")        echo -n "8";;
"----.")        echo -n "9";;
".-")              echo -n "A";;
"-...")          echo -n "B";;
"-.-.")          echo -n "C";;
"-..")            echo -n "D";;
".")                echo -n "E";;
"..-.")          echo -n "F";;
"--.")            echo -n "G";;
"....")          echo -n "H";;
"..")              echo -n "I";;
".---")          echo -n "J";;
"-.-")            echo -n "K";;
".-..")          echo -n "L";;
"--")              echo -n "M";;
"-.")              echo -n "N";;
"---")            echo -n "O";;
".--.")          echo -n "P";;
"--.-")          echo -n "Q";;
".-.")            echo -n "R";;
"...")            echo -n "S";;
"-")                echo -n "T";;
"..-")            echo -n "U";;
"...-")          echo -n "V";;
".--")            echo -n "W";;
"-..-")          echo -n "X";;
"-.--")          echo -n "Y";;
"--..")          echo -n "Z";;
".-.-.-")           echo -n ".";;
"--..--")           echo -n ",";;
"..--..")           echo -n "?";;
"-...-")            echo -n "=";;
*)                  echo -n " ";;
esac
}
while read -N1 f;				#reading morse from file
 do
	if [[ $f == $'\n' ]];		#checking for next lines
	then
		printf '\n'
	elif [[ $f != '/' ]]		
	then
			p+="$f"				#storing the group of morses in a variable until / is found
		else
		check "$p"				#calling the function to check for corresponding morse to text
		unset p					#reseting the variable
	fi
done < $1
}
echo "Enter filename .txt or .morse: $1"
fullfilename=$1					#assigning the filename from commandline
read fullfilename 				
 filename=$(basename "$fullfilename")		
ext="${filename##*.}"			#checking for extensions of file
if [[  "$ext" == "txt" ]]
then
d=1								#txt file
elif [[ "$ext" == "morse" ]]
then
d=2								#morse file
else 
echo "wrong file"				#printing for wrong input
fi
case $d in
1)  echo "Converting text file to morse code....."
    encode $fullfilename;;			#calling encoding function
2)  echo "Converting morse code to text file....."
    decode $fullfilename;;			#calling decoding function
*)  exit;;   						#terminating the program
esac
 