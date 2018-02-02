#! /bin/bash


VERT="\e[0;32m"
ROUGE="\e[0;31m"
DEFAULT="\e[0;0m"


for rep in /home/*
do
	if [ -d $rep ]
	then
		echo "$rep"
		if [ -w $rep ]
		then
			echo -e "$VERT ACCES GRANTED $DEFAULT"
		else
			echo -e "$ROUGE ACCES DENIED $DEFAULT"
		fi
	fi
done

