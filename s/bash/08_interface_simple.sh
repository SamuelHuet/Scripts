#! /bin/bash

#Programme d'interface utilisateur simplifié

#Affiche le menu :
#1- Dossier parent
#2- Aller dans un dossier
#3- Lister contenu du dossier
#4- Editer document
#5- Quitter

VERT="\e[0;32m"
ROUGE="\e[0;33m"
DEFAULT="\e[0;0m"
SAVEC="\033[s"
RESTOREC="\033[u"
CLEARL="\033[K"


rep='m'
dossier=0

#Si m entré, on affiche le menu 
while [ $rep != 'q' ]
do
	tput clear
	#Affiche l'user, le dossier actuel

	tput cup 2 10
	echo "Bonjour $(whoami)."

	tput cup 2 30
	echo -e "$VERT Dossier actuel : $(pwd) $DEFAUL"

	tput cup 4 10
	echo "MENU :"
	tput cup 6 5
	echo "1- Dossier parent"
	tput cup 7 5
	echo "2- Changer dossier"
	tput cup 8 5
	echo "3- Lister contenu"
	tput cup 9 5
	echo "4- Editer document"
	tput cup 10 5
	echo "5- Supprimer document"
	tput cup 11 5
	echo "6- Quitter"
	rep=1
	while [ $rep -ge 1 ] && [ $rep -le 5 ]
		do
		tput cup 13 10
		echo -n "Tapez votre choix (q pour quitter) : "
		read rep
		case $rep in
		1)	
			echo "1- Dossier parent"
			cd ..
			echo -e "$VERT Dossier actuel : $(pwd) $DEFAULT "
			;;
		2)	
			echo "2- Changer dossier"
			echo -n "Dans quel dossier voulez-vous entrer ? "
			read dossier
			cd $dossier
			echo -e "$VERT Dossier actuel : $(pwd) $DEFAUL"
			echo "$SAVEC"
			tput cup 2 30
			echo "$CLEARL"
			tput cup 2 30
			echo -e "$VERT Dossier actuel : $(pwd) $DEFAUL"
			echo "$RESTOREC"
			;;
		3)	
			echo "3- Lister contenu"
			ls --color=auto
			;;

		4)	
			echo "4- Editer document"
			echo -n "Quel est le nom du document à éditer ? "
			read dossier
			vim $dossier
			;;

		5)	
			echo "5- Supprimer doccument"
			;;
		esac

	done

done


