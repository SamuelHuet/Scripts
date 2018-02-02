#!/bin/bash

echo "Bonjour $LOGNAME. Voici le contenu de $(pwd) : "
ls -ail
nb=$(ls |wc -l)
echo "$nb fichiers trouvés"

