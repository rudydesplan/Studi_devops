# Définition de l'image de base
FROM node:latest

# Création du répertoire de travail dans le conteneur
WORKDIR /usr/src/app

# Copie des fichiers de dépendances
COPY package.json .

# Installation des dépendances
RUN npm install

# Copie des autres fichiers de l'application et des vues
COPY . .

# Exposition du port 3000
EXPOSE 3000

# Commande pour démarrer l'application
CMD [ "node", "app.js" ]
