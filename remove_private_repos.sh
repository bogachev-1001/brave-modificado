#!/bin/bash

CONFIG_FILE="$HOME/brave_source/src/.git/config"

# Verifica se o arquivo existe
if [ ! -f "$CONFIG_FILE" ]; then
    echo "❌ Arquivo .git/config não encontrado!"
    exit 1
fi

echo "🔍 Removendo referências ao chrome-internal.googlesource.com..."
sed -i '/chrome-internal.googlesource.com/d' "$CONFIG_FILE"

echo "✅ Limpeza concluída! Agora o Git não tentará mais acessar os servidores privados."
