#!/bin/bash

while getopts "abcd:e" option
do
	echo ""
	echo "getopts a trouvé l'option $option"
	case $option in
		a)
			echo "exec de l'option a"
			echo "l'option suivante est la $OPTIND"
			;;
		b)
			echo "exec de l'option b"
			echo "l'option suivante est la $OPTIND"
			;;
		c)
			echo "exec de l'option c"
			echo "l'option suivante est la $OPTIND"
			;;
		d)
			echo "exec de l'option d"
			if [ $OPTARG = "-*" ]
			then
				echo "Un argument est attendu ici"
				exit 3
			else
				echo "Arguments à traiter : $OPTARG"
			fi
			echo "l'option suivante est la $OPTIND"
			;;
		e)
			echo "exec de l'option e"
			echo "l'option suivante est la $OPTIND"
			;;
		\?)
			echo "option invalide"
			exit 1
			;;
		:)
			echo "l'option $OPTARG requiert un argument"
			exit 4
			;;
		default)
			echo "On devrait pas voir ça"
			exit 2
			;;
	esac
done
echo ""
echo "analyse des options terminée"
echo "Liste des trucs $*"
shift $((OPTIND-1))
echo "Liste des trucs $*"


exit 0
