#! /bin/bash
clear

if [ "$#" != 1 ]; then
    echo "./exo_6.sh <nombre>"
    exit 1
fi

somme=0
for i in `seq 1 $1`; do
    somme=$(($somme + $i))
done

printf "La somme est   %d\n" $somme
printf "Gauss nous dit %d\n" $(((($1 + 1) * $1) / 2))
