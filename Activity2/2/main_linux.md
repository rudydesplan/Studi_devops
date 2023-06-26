# Deploying Node.js application to Kubernetes

This repository provides a bash script to automate the process of deploying a Node.js application to a Kubernetes cluster.

The script follows these steps:

1. Checks for a running local Docker registry and starts it if it's not running.
2. Builds a Docker image of the application.
3. Tests the application by starting a container and making an HTTP request to it.
4. If the test is successful, it pushes the Docker image to the local Docker registry.
5. It then deploys the application to the Kubernetes cluster using kubectl.
   
## Bash Script Explanation

Here is a breakdown of the bash script:

Defining variables: Variables are defined for the Docker image name, the Kubernetes deployment name, and the Kubernetes service name. You can modify these to suit your needs.

Checking local Docker registry: The script checks if a Docker container named "local-registry" is running. If it's not running, it starts it.

Building Docker image: The script navigates to the directory containing the Dockerfile and builds a Docker image tagged with the name defined in the variable $IMAGE_NAME.

Testing the application: The Docker image is run in a container, and the application is tested by making a curl request to the server running in the container.

Pushing Docker image to registry: If the test is successful, the script pushes the Docker image to the local Docker registry.

Deploying application to Kubernetes: The script deploys the application to the Kubernetes cluster using kubectl.
It creates a Deployment and a LoadBalancer Service with the names defined in the variables $DEPLOYMENT_NAME and $SERVICE_NAME.

## How to Use

First, make sure you have Docker, kubectl, and a Kubernetes cluster installed and configured on your machine.

Next, modify the script variables to match your application's details.

Run the bash script. If everything is configured correctly, your application should be deployed to your Kubernetes cluster.

## Requirements

Docker: To build and run your Docker image.

Kubernetes: To deploy your application.

kubectl: To interact with your Kubernetes cluster.

curl: To test your application.

Local Docker registry: To store your Docker images. The script checks if it's running and starts it if it isn't.

## Troubleshooting

Make sure all the software mentioned in the requirements is installed and correctly configured.

Check the application logs in the Docker container for debugging if the test fails.

Use kubectl describe and kubectl logs for debugging if the Kubernetes deployment fails.
