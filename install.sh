#!/bin/bash

DOTFILES_DIR="$HOME/Code/dotfiles"

declare -A FILES_TO_COPY=(
  [".config/nvim"]="$DOTFILES_DIR/nvim"
  [".bashrc"]="$DOTFILES_DIR/.bashrc"
  [".profile"]="$DOTFILES_DIR/.profile"
  # Agrega más archivos y directorios según sea necesario
)

for FILE in "${!FILES_TO_COPY[@]}"; do
  TARGET="$HOME/$FILE"
  SOURCE="${FILES_TO_COPY[$FILE]}"

  if [ -d "$SOURCE" ]; then
    # Si es un directorio, copia todo el contenido recursivamente
    echo "Copiando contenido del directorio $SOURCE a $TARGET"
    rsync -avh --delete "$SOURCE/" "$TARGET/"
  else
    # Si es un archivo, copia el archivo
    echo "Copiando archivo $SOURCE a $TARGET"
    cp "$SOURCE" "$TARGET"
  fi

  if [ $? -eq 0 ]; then
    echo "Copiado exitosamente: $SOURCE a $TARGET"
  else
    echo "Error al copiar: $SOURCE a $TARGET"
  fi
done
