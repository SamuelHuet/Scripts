#! /bin/bash

#Programme d'interface utilisateur simplifié

#Affiche le menu :
#1- Dossier parent
#2- Aller dans un dossier
#3- Lister contenu du dossier
#4- Editer document
#5- Supprimer document
#6- Reset la session
#c- Clear historique
#q- Quitter

VERT="\e[0;32m"
ROUGE="\e[0;31m"
DEFAULT="\e[0;0m"
SAVEC="\033[s"
RESTOREC="\033[u"
CLEARL="\033[K"
DOSS="\e[1;34m"
FILE="\e[1;36m"
REPVOID=0

rep='m'
dossier=0
document=0

emplacement(){
    if [ -w $(pwd) ]
	#En vert si dossier autorisé en écriture
    then
	echo -n "$VERT Dossier actuel : $(pwd) $DEFAULT"
	#En rouge si pas de droit ecriture
    else
	echo -n "$ROUGE Dossier actuel : $(pwd) $DEFAULT"
    fi
    echo -n "$SAVEC"
    tput cup 2 30
    echo -n "$CLEARL"
    if [ -w $(pwd) ]
	#En vert si dossier autorisé en écriture
    then
	echo -n "$VERT Dossier actuel : $(pwd) $DEFAULT"
	#En rouge si pas de drit ecriture
    else
	echo -n "$ROUGE Dossier actuel : $(pwd) $DEFAULT"
    fi
    echo -n "$RESTOREC"
}

showDir(){
    for fic in *
    do
	if [ -d $fic ]
	then
	    echo "$DOSS $fic $DEFAULT"
	    REPVOID=$(($1+1))
	fi
    done
    #BUG, NE REVOIE PAS
    return $1
}


showFile(){
    for fic in *
    do
	if [ -f $fic ]
	then
	    echo "$FILE $fic $DEFAULT"
	    REPVOID=$(($1+1))
	fi
    done
    #BUG, NE REVOIE PAS
    return $1

}

#Si m entré, on affiche le menu 
while [ $rep != "q" ]
do
    tput clear
    #Affiche l'user, le dossier actuel

    tput cup 2 10
    echo -n "Bonjour $(whoami)."

    tput cup 2 30
    if [ -w $(pwd) ]
	#En vert si dossier autorisé en écriture
    then
	echo -n "$VERT Dossier actuel : $(pwd) $DEFAULT"
	#En rouge si pas de drit ecriture
    else
	echo -n "$ROUGE Dossier actuel : $(pwd) $DEFAULT"
    fi

    tput cup 4 10
    echo "MENU :"
    tput cup 6 5
    echo "1- Dossier parent"
    tput cup 7 5
    echo "2- Entrer dans le dossier : "
    tput cup 8 5
    echo "3- Lister contenu"
    tput cup 9 5
    echo "4- Editer document"
    tput cup 10 5
    echo "5- Supprimer document"
    tput cup 11 5
    echo "c- Effacer l'historique"
    tput cup 12 5
    echo "q- Quitter"
    rep=1
    while [ $rep -ge 1 ] && [ $rep -le 5 ]
    do
	echo "\033[10C"
	echo -n "Tapez votre choix (q pour quitter) : "
	read rep
	case $rep in
	    1)	
		echo "1- Dossier parent"
		cd ..
		emplacement
		;;
	    2)	
		echo "2- Entrer dans le dossier :"


		echo -n "Dans quel dossier voulez-vous entrer ? "
		read dossier
		if [ -d $dossier ]
		then
		    cd $dossier
		    emplacement
		fi
		;;
	    3)	
		echo -n "3- Lister contenu"
		echo -n "$DOSS    Répertoire $DEFAULT"
		echo -n "$FILE  Document $DEFAULT"
		echo "\033[1B"
		REPVOID=0
		REPVOID=$(showDir $REPVOID)
		REPVOID=$(showFile $REPVOID)
		#Si c'est vide, prévoir une réponse
		if [ $REPVOID -eq 0 ]
		then
		    echo "$ROUGE Ce répertoire est vide. $DEFAULT"
		fi
		;;

	    4)	
		echo "4- Editer document"
		echo -n "Quel est le nom du document à éditer ? "
		showFile 0
		read document
		if [ $?-eq 0 ]
		then
		    echo "$ROUGE Ce répertoire est vide. $DEFAULT"
		fi
		vim $document

		;;

	    5)	
		echo "5- Supprimer doccument"
		showFile 0
		#Si c'est vide, prévoir une réponse
		if [ $?-eq 0 ]
		then
		    echo "$ROUGE Ce répertoire est vide. $DEFAULT"
		fi
		read document
		if [ -f &$document ]
		then
		    rm $document
		else
		    echo "Le nom etré ne correspond à aucun document"
		fi
		;;
	esac

    done

done

tput clear

