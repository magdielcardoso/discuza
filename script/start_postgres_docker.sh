#!/bin/bash
# Script para iniciar o serviço PostgreSQL usando Docker Compose

COMPOSE_FILE="docker/docker-compose.yml"
SERVICE_NAME="postgres"

echo "Iniciando o serviço $SERVICE_NAME do arquivo $COMPOSE_FILE..."

# Verifica se o docker-compose.yml existe
if [ ! -f "$COMPOSE_FILE" ]; then
  echo "Erro: Arquivo $COMPOSE_FILE não encontrado!"
  exit 1
fi

# Inicia o serviço postgres em modo detached
docker-compose -f "$COMPOSE_FILE" up -d $SERVICE_NAME

if [ $? -eq 0 ]; then
  echo "Serviço $SERVICE_NAME iniciado com sucesso."
else
  echo "Erro ao iniciar o serviço $SERVICE_NAME."
  exit 1
fi

exit 0 