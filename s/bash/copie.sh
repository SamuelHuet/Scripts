#! /bin/bash

#test du nombre de param
if [ $# -eq 2 ]
then
	#test si le fichier à copier est ordinaire
	if [ -f $1 ]
	then
		#test si le fichier à copier est lisible
		if [ -r $1 ]
		then
			#test si la destination est un dossier
			if [ -d $2 ]
			then
				#test si la destination est dispo en lecture  et en ouverture
				if [ -r $2 ] && [ -x $2 ]
				then
					#test si la destination est accessible en ecriture
					if [ -w $2 ]
					then
						#copie du fichier vers la destination
						cp $1 $2
						echo "Oui Maître. Bien maître"
						#test de la réussite de la copie (malgré tous les autres tests)
						if [ $? -eq 0 ]
						then
							echo "La copie est un succès total Maître"
							echo "Passez une bonne journée Maître"
							exit 0
						else
							echo "Je suis désolé Maître... Il semblerait que le déménageur nous ait fait faut bond..."
							echo "Code d'erreur : 7"
							exit 7
						fi
					else
						echo "Maîîîîître le sol est bien trop glissant"
						echo "La destination n'et pas autorisée en ecriture"
						echo "Code d'erreur : 6"
						exit 6
					fi
				else
					echo "Navré mon maître, j'ai égaré la clef"
					echo "le dossier de destination n'est pas ouvrable"
					echo "Code d'erreur 5"
					exit 5
				fi
			else
				echo "Heu... Maître.. C'est le placard à balais que vous tentez d'ouvrir..."
				echo "La destination n'est pas un dossier"
				echo "Code d'erreur : 4"
				exit 4
			fi
		else
			echo "De toute évidence, ce la,gage n'est plus pratiqué depuis des siècles Maître"
			echo "le fichier cible n'est mpas autorisé en lecture"
			echo "Code d'erreur : 3"
			exit 3
		fi
	else
		echo "Toutes mes excuses maître, on ne peut malheureusement pas 'déplacer' le donjon"
		echo "Ce type de fichier ne peut pas être copié"
		echo "Code d'erreur : 2"
		exit 2
	fi
else
	echo "Gné.. Pas compris"
	echo "Nombre de paramètre incorrect"
	echo "Code d'erreur : 1"
	exit 1
fi


