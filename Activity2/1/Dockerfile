# Base image definition
FROM node:latest

# Creating the working directory inside the container
WORKDIR /app

# Copying dependency files
COPY ./app/package*.json ./

# Installing dependencies
RUN npm install

# Copying other application files and views
COPY ./app .

# Exposing port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
