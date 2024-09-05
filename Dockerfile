# Usar a imagem oficial do Node.js como base
FROM node:14

# Criar diretório de trabalho
WORKDIR /usr/src/app

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar o restante do código
COPY . .

# Expor a porta do servidor
EXPOSE 3000

# Comando para rodar o servidor
CMD ["node", "server.js"]