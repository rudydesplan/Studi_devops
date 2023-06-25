# Node.js Application Dockerfile

This repository contains the Dockerfile for a simple "Hello, World!" Node.js application.

### Application Details

This Node.js application responds with 'Hello, World!' to any incoming HTTP requests.

The application's source code is contained within the app.js file.

This is a simple script that creates an HTTP server on port 3000 and responds with 'Hello, World!' to all requests.

### Dockerfile Details

The base image will be the latest version of Node.js

The working directory in the Docker image is `/app`

It copies the `package.json` from the `./app` directory into the /app directory in the Docker image.

It installs the Node.js dependencies with the `npm install` command.

It copies the remaining files from your local `./app` directory to the `/app` directory in your Docker image.

It exposes port 3000 in the Docker image to allow for network communication.

Finally, it starts the application with the `npm start` command.

## How to Build

navigate to the directory containing the Dockerfile and run the following command:

`docker build -t hello_world_app`

This command builds the Docker image and tags it as `hello_world_app` .

## How to Run

After building the image, you can run a container from the image using the following command : 

`docker run -p 3000:3000 -d hello_world_app` .

This command runs the Docker container in detached mode (-d)

and maps port 3000 in the container to port 3000 on your host machine (-p 3000:3000).

## How to Access

Once the container is running, you can access the application at:

`http://localhost:3000`

### Notes

This Dockerfile assumes that your Node.js application's code is located in the ./app directory in the same directory as your Dockerfile.

The ./app directory should include the package.json and app.js files.










