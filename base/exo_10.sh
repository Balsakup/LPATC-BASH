#! /bin/bash
clear

if [ "$#" != 1 ]; then
    echo "./exo_10.sh <nombre>"
    exit 1
fi

for i in `seq 2 $(($1 / 2))`; do
    if [ $(($1 % $i)) == 0 ]; then
        echo "Pas premier"
        exit 1
    fi
done

echo "Premier"
