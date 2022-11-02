#!/bin/bash
decode()
{
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
while read -N1 f;
 do
	if [[ $f != '/' ]]
	then
			p+="$f"
	else
		check "$p"
		unset p
	fi
done < test.morse
}
decode