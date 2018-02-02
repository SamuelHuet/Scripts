#!/bin/bash

#Connection avec http://192.168.91.130/cgi-bin/gestion.sh
#Fichier à placer dans /usr/lib/cgi-bin
#Activer le CGI :
#	#>a2enmod cgi      
# 	#>systemctl restart apache2

echo "Content-type: text/html"
echo ""
echo "<html>
	<head>
		<title>GESTION</title>
	</head>
	<body bgcolor='#9999FF'>
		<h1>Gestion du serveur</h1>"
echo "Coucou $LOGNAME !"