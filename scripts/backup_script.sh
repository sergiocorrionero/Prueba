#!/bin/bash

# Detener el script si hay errores
set -e

echo "Configurando usuario de Git..."
git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

echo "Verificando si hay cambios..."
if [[ -n "$(git status --porcelain)" ]]; then
  echo "Hay cambios, creando commit..."
  git add .
  git commit -m "Backup automático: $(date)"
  git push
else
  echo "No hay cambios que respaldar."
fi
