#!/bin/bash
# push.sh — Lance ce script depuis ton Mac après chaque session Cowork
# Usage : double-clic ou  bash ~/mon-app/push.sh

cd "$(dirname "$0")"

# Vérifie qu'on est dans un repo git
if [ ! -d ".git" ]; then
  echo "❌ Pas de repo git trouvé dans $(pwd)"
  echo "   Lance d'abord : git init && git remote add origin https://github.com/hillrichmtl-design/mon-app.git"
  exit 1
fi

# Affiche les fichiers modifiés
echo "📋 Fichiers modifiés :"
git status --short

# Demande un message de commit
echo ""
read -p "💬 Message de commit (ou Entrée pour message auto) : " MSG
if [ -z "$MSG" ]; then
  MSG="Mise à jour — $(date '+%d %b %Y %H:%M')"
fi

# Commit et push
git add -A
git commit -m "$MSG

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
git push origin main

echo ""
echo "✅ Poussé vers GitHub : https://github.com/hillrichmtl-design/mon-app"
