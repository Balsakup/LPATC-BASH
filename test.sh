#! /bin/bash
mot_de_passe="1234"

# Pour stocker l'état du nom de compte (0 = pas trouvé, 1 = trouvé)
bon_utilisateur=0

# Tant que le nom d'utilisateur est pas le bon
while [ "$bon_utilisateur" = 0 ]; do
    echo "Quel est votre nom d'utilisateur ?"
    read tmp_user

    # Si le nom rentré est le bon
    if [ "$tmp_user" == "$USER" ]; then
        # On change l'état de la variable
        bon_utilisateur=1
    else
        # Sinon, on informe que le nom de compte est mauvais
        echo "Le nom d'utilisateur est invalide"
    fi
done

# Quand le nom de compte est trouvé, on exécute les autres instructions

echo "Quel est votre mot de passe ?"
read tmp_mdp

if [ "$tmp_mdp" = "$mot_de_pass" ]; then
    echo "Mot de passe correct"
else
    echo "Mot de passe incorrect"
fi
