#! /bin/bash

##############################
# FONCTIONS
##############################
function hello() {
    printf "%b########%b  %b########%b  %b######%b  %b####%b %b########%b %b########%b\n" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m"
    printf "%b##%b     %b##%b %b##%b       %b##%b    %b##%b  %b##%b       %b##%b  %b##%b      \n" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m"
    printf "%b##%b     %b##%b %b##%b       %b##%b        %b##%b      %b##%b   %b##%b      \n" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m"
    printf "%b########%b  %b######%b    %b######%b   %b##%b     %b##%b    %b######%b  \n" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m"
    printf "%b##%b   %b##%b   %b##%b             %b##%b  %b##%b    %b##%b     %b##%b      \n" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m"
    printf "%b##%b    %b##%b  %b##%b       %b##%b    %b##%b  %b##%b   %b##%b      %b##%b      \n" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m"
    printf "%b##%b     %b##%b %b########%b  %b######%b  %b####%b %b########%b %b########%b\n" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m" "\033[105;95m" "\033[0m"
    printf "                      Redimensionnement d'image :D\n"
    printf "==================================================\n\n"
}

function bye() {
    printf "\n==================================================\n"
    printf "|            Fin du redimensionnement            |\n"
    printf "==================================================\n"
}

function checkParam() {
    if [ "$1" != 1 ] || !( [[ "$2" =~ ^[0-9]+%$ ]] || [[ "$2" =~ ^[0-9]+x[0-9]+$ ]] ); then
        printf "%b>> Paramètre d'entré non valide\n%b" "\033[1;31m" "\033[0m"
        printf "\t./resize.sh <taille>\n\n"
        printf "Exemples: \n"
        printf "\t./resize.sh 10%%\n"
        printf "\t./resize.sh 128x128\n"
        bye
        exit 1
    fi
}

function processing() {
    printf "%b>> Début du traitement de l'image $1%b\n" "\033[93m" "\033[0m"
    out=`echo "$1" | cut -d "." -f1`
    convert $1 -resize $2 "resized/$out@$2.jpg"
    printf "%b>> Fin du traitement de l'image $1%b\n\n" "\033[92m" "\033[0m"
}

function browsePic() {
    if ! [ -d "resized" ]; then
        printf "%b>> Création du dossier de stockage%b\n" "\033[32m" "\033[0m"
        mkdir resized
    else
        printf "%b>> Dossier de stockage exitant. Inutile de le recréer%b\n" "\033[31m" "\033[0m"
    fi

    printf "\n"

    for f in $(ls); do
        case "$f" in
            *.jpg)
                processing $f $1
                ;;
            *.JPG)
                processing $f $1
                ;;
        esac
    done
}





##############################
# SCRIPT
##############################
clear
hello
checkParam $# $1
browsePic $1
bye
