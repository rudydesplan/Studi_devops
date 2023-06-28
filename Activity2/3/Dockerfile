# Base image definition
FROM node:latest as builder

# Creating the working directory inside the container
WORKDIR /app

# Copying dependency files
COPY ./app/package*.json ./

# Installing dependencies
RUN npm install

# Copying other application files
COPY ./app .

# Build the application
RUN npm run build

# Expose port 4200
EXPOSE 4200

# Start the application
CMD ["npm", "start"]
