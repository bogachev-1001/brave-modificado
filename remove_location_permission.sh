#!/bin/bash

set -e  # Parar se algum comando falhar

BRAVE_DIR="$HOME/brave_source/src"

echo "🔍 Buscando arquivos com referência à permissão de localização..."
FILES=$(grep -rl "ACCESS_FINE_LOCATION" "$BRAVE_DIR")

echo "🚀 Removendo permissão de localização dos arquivos..."
for FILE in $FILES; do
    echo "✂️ Editando $FILE"
    sed -i '/ACCESS_FINE_LOCATION/d' "$FILE"
done

echo "✅ Remoção concluída! Agora podemos prosseguir com a compilação."
