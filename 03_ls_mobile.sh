#!/bin/bash

echo "Bonjour $LOGNAME. Voici le contenu de $1 : "
ls $1 -ail
nb=$(ls $1 |wc -l)
echo "$nb fichiers trouvés"

