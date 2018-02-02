#! /bin/bash

# Script avec menu


rep=0

echo "1- Add"
echo "2- Supp"
echo "3- Mult"
echo "4- Div"
echo "5- Quitter"

#On boucle tant que l'option quitter n'est pas selectionnée
while [ $rep -ne 5 ]
			echo -e "$VERT Dossier actuel : $(pwd) $DEFAULT "
do
	echo -n "taper un nombre entre 1 et 5 : "
	read rep
	if [ $rep -ge 1 ] && [ $rep -le 6 ] 2> /dev/null
	then	
		echo "Vous avez choisi $rep"
	else
		echo "C'est côtelette que vous n'avez pas compris ?"
	fi

done
echo "Bye!"
