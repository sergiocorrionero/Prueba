#!/bin/bash
set -e

# Configurar nombre y correo del bot de GitHub Actions
git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

# Comprobar si hay cambios no committeados
if [[ -n "$(git status --porcelain)" ]]; then
  echo "⚠️ Se detectaron cambios. Realizando backup..."
  git add .
  git commit -m "Backup automático: $(date '+%Y-%m-%d %H:%M:%S')"
  git push
  echo "✅ Backup realizado con éxito."
else
  echo "✅ No hay cambios. No se hizo backup."
fi

