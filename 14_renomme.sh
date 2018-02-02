#!/bin/bash

#Réaliser un script renomme.sh pouvant prendre ces paramètres :
# -i Doit être suivi du dossier source des fichiers (obligatoire)
# -d Doit être suivi du dossier de destination (obligatoire)
# -p Doit être suivis d'un préfix de renommage (optionnel, par défaut F"
# -r Indique que les fichiers seront lister dans l'ordre non alphabétique (optionnel)
# -n Doit être suivis du nombre de digits dans le renommage (optionnel, par defaut 2"
#Une fois les arguments récupérés, le scripts devra copier des fichies .txt dans un dossier source
#et les coller dans un dossier destination en les renommant de cette manière : [Préfixe][Digits].txt
#puis les afficher selon l'ordre choisis par -r 

aide="$(basename $0) -i <dossier src> -d <dossier dest> [-p <prefixe> -r  -n <nbre digits>]"

pref="F"
rev=""
nbre=2

while getopts ":i:d:p:rn:" option
do
	case $option in 
	
		i)	src=$OPTARG
		;;
		
		d)	dest=$OPTARG
		;;
		
		p)	pref=$OPTARG
		;;
			
		r)	rev="-r"
		;;
		
		n)	nbre=$OPTARG
		;;
		
		:)	echo "L'option $option doit être suivis d'un argument."
		;;
		
		\?)	echo "Ce paramètre n'est pas géré."
		;;
	esac
done

# Paramètres obligatoires ?

if [ -z $src ] || [ -z $dest ]
then
	echo "Un des paramètre OBLIGATOIRE est manquant"
	echo $aide
	exit 1
fi

# echo "Options correctes :"
# echo "- Dossier source : 		$src"
# echo "- Dossier destination : 	$dest"
# echo "- Préfixe : 				'$pref'"
# echo "- Reverse : 				'$rev'"
# echo "- Nombre de digits : 		$nombre"

destin=$(pwd)/$dest
cd $src
inc=1
format="%s%0${nbre}d.%s"

for fic in $(ls $rev)
do
	ext=${fic##*.}
	ficdest=$(printf $format $pref $inc $ext)
	echo "$fic -> $destin/$ficdest"
	inc=$((inc+1))
done
