#!/usr/bin/env bash
# This bash script creates a new Vue + Vite project using a docker image
source .devcontainer/.env

FOLDER_NAME=${PROJECT_NAME}_frontend
FRONTEND_PATH=${PWD}/${FOLDER_NAME}

function generateProject () {
    echo -e "\nSe va a generar un nuevo proyecto Vue y Vite en $FRONTEND_PATH\n"
    docker run --rm -v $FRONTEND_PATH:/app node:current-alpine sh -c "cd /app && npm init -y vite@latest ./ -- --template vue && npm install --loglevel verbose"
    sudo chown -R $USER:$USER $FOLDER_NAME
    #cp .devcontainer/frontend/config/vite.config.template.js $FRONTEND_PATH/vite.config.template.js
    echo -e "\n✔️  Proyecto vue creado en $FRONTEND_PATH\n"
}

if [ -d "$FRONTEND_PATH" ];
then
    echo -e "\n❌ Advertencia: Ya existe un directorio llamado $FOLDER_NAME.\n No se generará el proyecto.\n"
else
	generateProject
fi

