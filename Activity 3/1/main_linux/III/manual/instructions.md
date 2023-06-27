Manual instructions 

## Preparation

Ensure that your Kubernetes cluster is up and running and that you have the kubectl command-line tool installed and configured to manage your cluster.

## Create Elasticsearch Docker Image

Run the command : 
`docker pull elasticsearch:8.8.1`

## Create a Namespace
It's a good practice to create a new namespace for the Elasticsearch installation for logical separation in Kubernetes.
This can be done with the command: 

`kubectl create namespace elasticsearch`

## Create Elasticsearch Deployment

Run the command :

`kubectl apply -f elasticsearch-deployment.yaml -n elasticsearch`

## Create a Service

To access Elasticsearch from outside the Kubernetes cluster, you need to create a service. 

Run the command :

`kubectl apply -f elasticsearch-service.yaml -n elasticsearch`

## Test your Elasticsearch

Get the Elasticsearch service URL with the command:

`kubectl get svc -n elasticsearch`  and try accessing it with curl.
