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
  mkdir -p "$(dirname "$TARGET")"
  cp -r "$SOURCE" "$TARGET"
done

