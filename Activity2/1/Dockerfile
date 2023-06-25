# Définition de l'image de base
FROM node:latest

# Création du répertoire de travail dans le conteneur
WORKDIR /app

# Copie des fichiers de dépendances
COPY ./app/package*.json ./

# Installation des dépendances
RUN npm install

# Copie des autres fichiers de l'application et des vues
COPY ./app .

# Exposition du port 3000
EXPOSE 3000

# Start the application
CMD [ "npm", "start" ]
