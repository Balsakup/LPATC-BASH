#! /bin/bash
clear

echo "Quelle année voulez-vous tester ?"
read annee

if [ "$(($annee % 4))" == 0 ] && [ "$(($annee % 100))" != 0 ] || [ "$(($annee % 400))" == 0 ]; then
    echo "Année bissextile"
else
    echo "Année non bissextile"
fi
