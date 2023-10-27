#!/bin/bash

# Assurez-vous que cwebp est installé

# Chemin vers le dossier contenant les images à convertir
input_folder="./img"

# Boucle pour convertir toutes les images non converties
for file in "$input_folder"/*; do
    extention="${file##*.}"

    # Si l'extention est différente de webp, on convertit l'image
    if [ "$extention" != "webp" ]; then
        cwebp -q 80 "$file" -o "${file%.*}.webp"
        
        # On supprime l'image originale
        rm "$file"
        
        # On remplace le nom de l'image dans le fichier index.html
        sed -i "s/$file/${file%.*}.webp/g" index.html
    fi


    
done

echo "Conversion et suppression terminées"