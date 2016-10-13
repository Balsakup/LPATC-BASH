#! /bin/bash
clear

if [ "$#" != 1 ]; then
    echo "./exo_4.sh <nombre>"
    exit 1
fi

printf "====================\n"
printf "| Table de %2d      |\n" $1
printf "====================\n"

for i in `seq 1 10`; do
    printf "%d x %-2d = %d\n" $1 $i $(($1 * $i))
done
