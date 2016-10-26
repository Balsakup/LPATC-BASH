#! /bin/bash
clear

if [ "$#" != 1 ]; then
    echo "./exo_9.sh <nombre>"
    exit 1
fi

mouton=0
cochon=0
poule=0
vache=0

for i in `seq 0 $1`; do
    case "$(($RANDOM%4))" in
        0)
            mouton=$(($mouton + 1));;
        1)
            cochon=$(($cochon + 1));;
        2)
            poule=$(($poule + 1));;
        3)
            vache=$(($vache + 1));;
    esac
done

printf "Il y a %d mouton(s), %d cochon(s), %d poule(s) et %d vache(s)\n" $mouton $cochon $poule $vache
