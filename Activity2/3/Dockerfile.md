# Hello World Angular Docker

This README provides a guide for building and running the Hello World Angular using Docker.

### Prerequisites

Docker installed on your machine.

### Dockerfile Overview

This Dockerfile describes the steps to create a Docker image for a Node.js application.

FROM node:latest as builder: This sets the base image for the Docker build. In this case, it uses the latest version of the official Node.js Docker image.

WORKDIR /app: This command sets the working directory inside the Docker container to be /app.

COPY ./app/package*.json ./: This command copies the package.json and package-lock.json (if exists) files from your local app directory to the current directory in the Docker container (i.e., /app).

RUN npm install: This command installs the dependencies of your application based on the package.json file.

COPY ./app .: This command copies the remaining files from your local app directory to the /app directory in the Docker container.

RUN npm run build: This command builds the application.

EXPOSE 4200: This command exposes port 4200 on the Docker container. This is the port at which our application runs.

CMD ["npm", "start"]: This command starts the application when the Docker container is run.
