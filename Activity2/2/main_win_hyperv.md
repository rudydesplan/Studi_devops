# Script Description

This PowerShell script is designed to deploy a Node.js application to a Kubernetes cluster on Minikube.

The application is packaged as a Docker image, tested, and then deployed to the Kubernetes cluster.

## Pre-requisites

Docker installed and running on your machine.

Minikube and kubectl installed on your machine.

A running Kubernetes cluster on Minikube.

PowerShell environment to run the script.

A Node.js application in a directory called app with a Dockerfile.

## Script Steps

Here are the steps that the script performs:

Defines variables for the Docker image name, the Kubernetes deployment name, and the Kubernetes service name.

Checks if a local Docker registry is running. If it is not running, it either starts an existing one or creates a new one.

Changes the current directory to the location of your Dockerfile.

Builds the Docker image from the Dockerfile in the app directory.

Runs the Docker image in a new container for testing purposes. The container runs detached on port 3000.

Tests the application by sending a GET request to http://localhost:3000.
It checks if the response contains "Hello, World!".
If the test is successful, it prints "Test successful!" Otherwise, it prints "Test failed!" and exits with a status of 1.

Stops and removes the test Docker container.

Pushes the Docker image to the local Docker registry.

Checks if Minikube is running and if the Minikube context exists. If not, it prints an error message and exits with a status of 1.

Sets the kubectl context to Minikube.

Uses kubectl to create a new deployment with the Docker image and exposes it as a service on port 3000.

### How to Use the Script

Replace # Fill in the path where the Dockerfile is located with the path to your Dockerfile and run the script in a PowerShell environment.

### Note

This script is tailored for a specific environment (Windows with Minikube running on Hyper-V) and a specific application (a Node.js application that responds with "Hello, World!" on port 3000). 
