#! /bin/bash

##############################
# FONCTIONS
##############################

#####
# Permet d'afficher un logo (code pas intéressant si vous êtes débutant)
#####
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

#####
# Permet d'afficher la fin du script
#####
function bye() {
    printf "\n==================================================\n"
    printf "|            Fin du redimensionnement            |\n"
    printf "==================================================\n"
}

#####
# Permet de vérifier si les paramètres sont correctes
#####
function checkParam() {
    # Si le nombre de paramètres est différent de 1 OU que le paramètre rentré n'est pas valide (pas du format: n% ou n%m)
    if [ "$1" != 1 ] || !( [[ "$2" =~ ^[0-9]+%$ ]] || [[ "$2" =~ ^[0-9]+x[0-9]+$ ]] ); then
        printf "%b>> Paramètre d'entré non valide\n%b" "\033[1;31m" "\033[0m"
        printf "\t./resize.sh <taille>\n\n"
        printf "Exemples: \n"
        printf "\t./resize.sh 10%%\n"
        printf "\t./resize.sh 128x128\n"
        bye    # On envoie le fin du script
        exit 1 # On quitte le script avec le code 1 (1 = erreur)
    fi
}

#####
# Permet de faire le traitement des images
#####
function processing() {
    # On affiche un message pour dire qu'on va traiter l'image
    printf "%b>> Début du traitement de l'image $1%b\n" "\033[93m" "\033[0m"
    # On définit le sortie de la convertion
    out=`echo "$1" | cut -d "." -f1`
    # On lance la convertion
    convert $1 -resize $2 "resized/$out@$2.jpg"
    # On affiche un message pour dire que le traitement est fini
    printf "%b>> Fin du traitement de l'image $1%b\n\n" "\033[92m" "\033[0m"
}

#####
# Permet de parcourir les images
####
function browsePic() {
    # Si la dossier `resized` n'existe pas
    if ! [ -d "resized" ]; then
        # On affiche le message de création
        printf "%b>> Création du dossier de stockage%b\n" "\033[32m" "\033[0m"
        # Puis on le créé
        mkdir resized
    else
        # Sinon on affiche un message pour dire qu'il est inutile de le recréer
        printf "%b>> Dossier de stockage exitant. Inutile de le recréer%b\n" "\033[31m" "\033[0m"
    fi

    # On saute une ligne
    printf "\n"

    # On parcours tous les fichiers du `ls` du dossier courrant
    for f in $(ls); do
        case "$f" in
            *.jpg) # Si le fichier fini par .jpg, on fait le traitement
                processing $f $1 # On appele la fonction processing avec le fichier en paramètres et la nouvelle dimenssion souhaitée
                ;;
            *.JPG) # Si le fichier fini par .JPG, on fait le traitement
                processing $f $1 # On appele la fonction processing avec le fichier en paramètres et la nouvelle dimenssion souhaitée
                ;;
        esac
    done
}





##############################
# SCRIPT
##############################
clear            # On nettoie le console
hello            # On affiche le message de début
checkParam $# $1 # On vérifie les paramètres ($# = nb de param, $1 = param 1)
browsePic $1     # On parcours les images ($1 = nouvelle dimension de l'image)
bye              # On affiche le message de fin
