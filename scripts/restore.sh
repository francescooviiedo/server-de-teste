#!/bin/bash

# Variáveis de ambiente
DB_HOST=${DB_HOST:-db}
DB_USER=${DB_USER:-root}
DB_PASSWORD=${DB_PASSWORD:-example}
NEW_DB_NAME=${NEW_DB_NAME:-troquei}
BACKUP_FILE=${BACKUP_FILE:-backup.sql}

# Criar novo banco de dados
mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $NEW_DB_NAME"

# Restaurar backup no novo banco de dados
mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $NEW_DB_NAME < $BACKUP_FILE

echo "Backup restaurado com sucesso no banco de dados $NEW_DB_NAME"