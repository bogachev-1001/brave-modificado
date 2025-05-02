#!/bin/bash

# Define o diretório do repositório
BRAVE_DIR=~/brave_source

# Verifica se o .gclient existe no diretório home
if [ -f ~/.gclient ]; then
    echo "[INFO] Usando .gclient de ~/"
    cp ~/.gclient $BRAVE_DIR/
else
    echo "[ERRO] Arquivo .gclient não encontrado no diretório home!"
    echo "Execute 'gclient config https://github.com/brave/brave-browser.git' para criar o arquivo."
    exit 1
fi

# Força a sincronização usando o .gclient copiado
cd $BRAVE_DIR
gclient sync --force --verbose

# Se a sincronização falhar, exibe erro e sai
if [ $? -ne 0 ]; then
    echo "[ERRO] Falha na sincronização do gclient!"
    exit 1
fi

# Inicia a compilação do Brave
echo "[INFO] Iniciando compilação do Brave..."
./compila_brave.sh
