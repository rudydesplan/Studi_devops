#!/bin/bash

Define variables
IMAGE_NAME="hello_world_app"
DEPLOYMENT_NAME="hello_world_deployment"
SERVICE_NAME="hello_world_service"

# Check if the local Docker registry is already running
if [ -z "$(docker ps -q -f name=local-registry)" ]; then
    if [ -z "$(docker ps -aq -f status=exited -f name=local-registry)" ]; then
        # Run the local Docker registry if it doesn't already exist
        docker run -d -p 5000:5000 --name=local-registry registry:2
    else
        # Restart the local Docker registry container if it is stopped
        docker start local-registry
    fi
fi

# Go to the main directory
cd # Fill in the path where the Dockerfile is located

# Build the Docker image
docker build -t localhost:5000/$IMAGE_NAME:latest ./app

# Check the Docker image
docker run --name test-container -d -p 3000:3000 localhost:5000/$IMAGE_NAME:latest
sleep 5 # Wait a few seconds for the application to start

# Test the application
curl -s http://localhost:3000 | grep "Hello, World!"
if [ $? -eq 0 ]
then
  echo "Test successful!"
else
  echo "Test failed!" >&2
  exit 1
fi

# Stop and remove the test container
docker stop test-container
docker rm test-container

# Push the Docker image
docker push localhost:5000/$IMAGE_NAME:latest

# Use kubectl to deploy the application
kubectl run $DEPLOYMENT_NAME --image=localhost:5000/$IMAGE_NAME:latest --port=3000
kubectl expose deployment $DEPLOYMENT_NAME --type=LoadBalancer --name=$SERVICE_NAME --port=3000
