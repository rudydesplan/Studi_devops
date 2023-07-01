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

### A - you can access your service using the minikube service command

`minikube service elasticsearch --namespace=elasticsearch`

This will open a web browser with your service. 

### B - using curl 

First You can get the IP address of your Minikube node with the following command:

`minikube ip`

Then the curl command 

`curl http://<MINIKUBE-IP>:30000`

Youu should receive a JSON response from the Elasticsearch server containing some basic information about the server, including the Elasticsearch version number.



