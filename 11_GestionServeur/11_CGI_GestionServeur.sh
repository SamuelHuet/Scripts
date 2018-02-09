#!/bin/bash

#Connection avec http://192.168.91.130/cgi-bin/gestion.sh
#Fichier à placer dans /usr/lib/cgi-bin
#Activer le CGI :
#	#>a2enmod cgi      
# 	#>systemctl restart apache2
# Ajouter www-data en admin
# Placer le dossier Images (contenant toutes les images dans /var/www/html/)

#Verification des paramètres GET
case $QUERY_STRING in
	allumessh)		
				systemctl status ssh >/dev/null
				if [ $? -eq 3 ]
				then
					sudo service ssh start 
				fi;;
	eteindressh)	
				systemctl status ssh >/dev/null
				if [ $? -eq 0 ]
				then
					sudo service ssh stop
				fi;;
	eteindrelinux)	sudo shutdown -h now;;
esac

echo "Content-type: text/html"
echo ""
echo "<html>
	<head>
		<title>GESTION</title>
	</head>
	<body bgcolor='#9999FF'>
		<h1>Gestion du serveur</h1>"

echo "Coucou $(whoami) ! <br/><br/>"
echo "<a href='?allumessh'> <img src='/Images/ssh_start.png'/> </a> <br/>" 			
echo "<a href='?eteindressh'>ETEINDRE SSH</a> <br/>"
echo "<a href='?eteindrelinux'> <img src='/Images/shutdown.png'/> </a> <br/>"