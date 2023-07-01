# Manual instructions

## 1 - Install Helm: Helm is a package manager for Kubernetes.
You can follow the installation instructions provided at https://helm.sh/docs/intro/install/ to install Helm on your Linux machine.

## 2 - Add the Elasticsearch Helm repository:

Run the following command to add the official Elasticsearch Helm repository:

`helm repo add elastic https://helm.elastic.co`

## 3 - Update the Helm repositories:

Run the following command to update the Helm repositories:

`helm repo update`

## 4 - Install Elasticsearch using Helm

`helm install elasticsearch elastic/elasticsearch`

## 5 - Accessing Elasticsearch

Check the Elasticsearch service using the following command:

`kubectl get svc`

This should display the Elasticsearch service and its external IP address.
