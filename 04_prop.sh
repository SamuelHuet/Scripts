#!/bin/bash

#test du nombre de paramètres
if [ $# -eq 1 ]
then	
	#test d'existence du paramètre
	if [ -e $1 ]
	then
		echo "Bonjour $LOGNAME. Voici des informations à propos de $1 : "
		if [ -f $1 ]
		then
			echo "C'est un fichier ordinaire"
		else
			if [ -d $1 ]
			then
				echo "C'est un dossier"
			else
				if [ -L $1 ]
				then
					echo "C'est un lien symbolique"
				else
					echo "C'est un autre type de fichier"
				fi
			fi
		fi
		echo "$1 est :"
		if [ -r $1 ]
		then
			echo "	Lisible"
		else
			echo "	Pas lisible"
		fi
		if [ -w $1 ]
		then
			echo "	Modifiable"
		else
			echo "	Pas modifiable"
		fi
		if [ -x $1 ]
		then
			echo "	Exécutable"
		else
			echo "	Pas éxecutable"
		fi
		if [ -s $1 ]
		then
			if [ -d $1 ]
			then
				echo "Le dossier fait $(du -sh $1)"
			else
				echo "Le fichier fait $(du -h  $1)"
			fi
		else
			echo "le fichier n'a pas de taille"
			echo "Code d'erreur : 3"
			exit 3
		fi
		exit 0
	else
		echo "$BASENAME $1 n'a pas été trouvé"
		echo "Code d'erreur : 2"
		exit 2
	fi
else
	echo "$(basename $0) : Nombre de paramètre incorect."
	echo "Syntaxe : &(localname $0) <fichier/dossier>"
	echo "Code d'erreur : 1"
	exit 1
fi
