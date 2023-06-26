# Kubernetes Deployment Script for hello_world_app

This repository contains a PowerShell script for building a Docker image of `hello_world_app`, pushing it to a local Docker registry, and deploying it to a Kubernetes cluster created by kind.

## Pre-requisites

- Docker should be installed on your machine.
- The Kubernetes cluster should be created by kind.
- Kind should be installed on your machine.
- The Kubernetes command-line tool, `kubectl`, should be installed on your machine.
- The Docker image is built from a `Dockerfile` located in the `app` directory. The `Dockerfile` and the application code should exist.

## Usage

1. Open a terminal and navigate to the directory containing the script.

2. Run the script

## What the Script Does

Checks if the local Docker registry is running. If not, it starts it.

Navigates to the directory where the Dockerfile is located.

Builds the Docker image using the Dockerfile.

Tests the Docker image by running it and checking if it returns the expected output.

Pushes the Docker image to the local Docker registry.

Checks if the context of the kind cluster exists.

Sets the kubectl context to the kind cluster.

Deploys the Docker image to the Kubernetes cluster using kubectl.

Exposes the deployment as a service.

## Note

This script assumes that the context name of the kind cluster is kind-test-cluster. Adjust this as necessary.

The script does not include error handling for all possible issues that might occur

