#!/bin/bash

encode(){
    declare -A morse
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
while read -r -N1 c;
 do
	c=${c^}
	if [[ $c == "\n" ]]
	then
		printf '//'
        break
	elif [[ $c == " " ]]
	then
		printf '/'

	else
		printf '%s/' "${morse[$c]}"
	fi
done < text.txt > test.morse
cat test.morse
}
encode
