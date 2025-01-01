#!/bin/bash

# Assurez-vous que cwebp est installé

# Chemin vers le dossier contenant les images à convertir
input_folder="./img"
extention="jpg"

# Boucle pour convertir toutes les images jpg en webp dans le dossier
for file in "$input_folder"/*.$extention; do
    if [ -f "$file" ]; then
        cwebp "$file" -o "${file%.$extention}.webp"
        rm "$file"  # Suppression de l'image jpg d'origine
    fi
done

echo "Conversion et suppression terminées"