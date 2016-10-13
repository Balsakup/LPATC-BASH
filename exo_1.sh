#! /bin/bash
clear

if [ "$#" != 2 ]; then
    echo "./exo_1.sh <nom> <mot de passe>"
    exit 1
fi

password="1234"

if [ "$1" = "$password" ] && [ "$2" = "$password" ]; then
    echo "Identifiants corrects"
else
    echo "Identifiants incorrects"
fi
