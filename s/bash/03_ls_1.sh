#!/bin/bash

#test du nombre de paramètres
if [ $# -eq 1 ]
then	
	if [ -e $1 ]
	then
		echo "Bonjour $LOGNAME. Voici le contenu de $1 : "
		ls $1 -ail
		nb=$(ls $1 |wc -l)
		echo "$nb fichiers trouvés"
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
