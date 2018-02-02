#!/bin/bash

#Super firewall à coder o/
#Accepte un paramètre, "start", "stop" ou "status"


EXT=ens33

case $1 in
	start)
		echo -n "Démarrage Firewall : "
		#On commence par clean toutes les règles et macro
		iptables -F
		iptables -X
		#Politiques par défaut
		iptables -P INPUT DROP
		iptables -P OUTPUT DROP
		iptables -P FORWARD DROP

		echo;;
	stop)
		echo -n "Arret Firewall : "
		echo;;
	status)
		iptables -L
		;;
	*)
		echo "$(basename $0) start|stop|status"
esac
