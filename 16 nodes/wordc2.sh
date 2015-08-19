#!/bin/sh

if [ "$1" = 1 ]; 
	then
	awk '{x[$2]+=$1}{y[$2]=$2" "x[$2]}END{for (z in y) print y[z]}' $2 |  sort -n
elif [ "$1" = 2 ]; then
	#statements
	awk '{x[$1]+=$2}{y[$1]=$1" "x[$1]}END{for (z in y) print y[z]}' $2 |  sort -n
fi