#! /bin/bash
clear

rand=$(($RANDOM % 99 + 1))
termine=0

while [ "$termine" = 0 ]; do
    echo "Proposez un nombre"
    read N

    if [ "$N" -lt "$rand" ]; then
        echo "Trop petit"
    fi

    if [ "$N" -gt "$rand" ]; then
        echo "Trop grand"
    fi

    if [ "$N" = "$rand" ]; then
        echo "Trouvé !!!!!!!"
        termine=1
    fi
done
