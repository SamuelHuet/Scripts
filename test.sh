#! /bin/bash


VERT="\e[0;32m"
ROUGE="\e[0;31m"
DEF="\e[0;0m"
COMM="./copie.sh"
touch texte
chmod -rwx texte
mkdir dostest
chmod -rwx dostest

#Test de la condition 1 :
$COMM
if [ $? -eq 1 ]
then
	echo -e "$VERT Le test de nombre de param fonctionne$DEF"
else
	echo -e "$ROUGE Le test de nombre de param ne fonctionne pas $DEF"
fi


#Test de la condition 2 :
$COMM /dev/sda1 .
if [ $? -eq 2 ]
then
	echo -e "$VERT Le test de fichier copiable fonctionne$DEF"
else
	echo -e "$ROUGE Le test de fichier copiable ne fonctionne pas $DEF"
fi


#Test de la condition 3 :
$COMM texte .
if [ $? -eq 3 ]
then
	echo -e "$VERT Le test de cible lisible fonctionne$DEF"
else
	echo -e "$ROUGE Le test de cible lisible ne fonctionne pas $DEF"
fi

chmod +r texte

#Test de la condition 4 :
$COMM texte /hom
if [ $? -eq 4 ]
then
	echo -e "$VERT Le test de destination dossier fonctionne$DEF"
else
	echo -e "$ROUGE Le test de destination dossier ne fonctionne pas $DEF"
fi


#Test de la condition 5 :
$COMM texte dostest
if [ $? -eq 5 ]
then
	echo -e "$VERT Le test de lecture/ouverture destination fonctionne$DEF"
else
	echo -e "$ROUGE Le test de lecture/ouverture destination ne fonctionne pas $DEF"
fi


chmod +rx dostest


#Test de la condition 6 :
$COMM texte dostest
if [ $? -eq 6 ]
then
	echo -e "$VERT Le test d'écriture destination fonctionne$DEF"
else
	echo -e "$ROUGE Le test d'écriture destination ne fonctionne pas $DEF"
fi

chmod +w dostest

#Test de la condition 7 :
$COMM texte dostest
if [ $? -ne 7 ]
then
	echo -e "$VERT La copie à fonctionné correctement. $DEF"
else
	echo -e "$ROUGE Une erreur non prévue est arrivée, contactez l'administrateur $DEF"
fi




