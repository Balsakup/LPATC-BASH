#! /bin/bash
clear

for i in `seq 1 10`; do
    printf "====================\n"
    printf "| Table de %2d      |\n" $i
    printf "====================\n"

    for j in `seq 1 10`; do
        printf "%-2d x %-2d = %3d\n" $i $j $(($i * $j))
    done

    printf "\n"
done
