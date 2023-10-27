#!/bin/bash

# On vérifie que cwebp est installé
cwebp -version &> /dev/null
if [ $? -ne 0 ]; then
    echo "cwebp n'est pas installé. Veuillez l'installer avant de continuer."
    exit 1
else
    echo "cwebp est installé"
fi

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

        # Get file basename
        filename=$(basename -- "$file")
        
        # On remplace le nom de l'image dans le fichier index.html
        # echo "s/$filename/${filename%.*}.webp/g"
        sed -i "" "s/$filename/${filename%.*}.webp/g" index.html
    fi
    
done

echo "Conversion et suppression terminées"