#!/bin/bash

# Variáveis de ambiente
DB_HOST=${DB_HOST:-db}
DB_USER=${DB_USER:-root}
DB_PASSWORD=${DB_PASSWORD:-example}
DB_NAME=${DB_NAME:-testdb}
BACKUP_FILE=${BACKUP_FILE:-backup.sql}

# Garantir que o diretório tenha as permissões corretas
chmod 777 /docker-entrypoint-initdb.d

# Criar backup
mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

echo "Backup do banco de dados $DB_NAME criado com sucesso em $BACKUP_FILE"