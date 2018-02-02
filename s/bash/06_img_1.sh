#! /bin/bash

# Conversion d'image
# jpg -> png
# réduit de 50%
# 

srce="$(pwd)/jpg"
dest="$(pwd)/png"

echo "Conversion des fichiers de $srce vers $dest."


for img in $srce/*
do
	imgdest=${img%.jpg}.png
done


