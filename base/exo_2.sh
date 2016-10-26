#! /bin/bash
clear

password="1234"

echo "Quel est votre nom d'utilisateur ?"
read tmp_user

echo "Quel est votre mot de passe ?"
read tmp_password

if [ "$tmp_user" = "$USER" ] && [ "$tmp_password" = "$password" ]; then
    echo "Identifiants corrects"
else
    echo "Identifiants incorrects"
fi
