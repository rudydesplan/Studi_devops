# How to set up Elasticsearch and connect it with your Kubernetes cluster

Option 1: Deploy ECK (Elasticsearch Operator) in your Kubernetes cluster.

ECK is an open-source operator provided by Elastic, the company behind Elasticsearch. It simplifies the deployment and management of Elasticsearch clusters on Kubernetes.

Option 2: Deploy a standalone Elasticsearch cluster.

You manually deploy and manage a standalone Elasticsearch cluster.

## I - Elastic Cloud on Kubernetes (ECK)

Elasticsearch provides their own official Kubernetes Operator called ECK (Elastic Cloud on Kubernetes), which simplifies the deployment and operation of Elasticsearch on Kubernetes.
This Operator allows you to declaratively manage and orchestrate Elasticsearch deployments, as well as Kibana and APM Server deployments.

Conclusion : It provides a high level of automation for managing Elasticsearch clusters, but is specific to Elasticsearch.

## II - Helm Chart

Helm is a package manager for Kubernetes, and Elasticsearch has an official Helm chart.

Conclusion : It provides a good balance between ease of use and flexibility, and can be used for many other applications besides Elasticsearch.

## III - Use Elasticsearch Docker Images

Elasticsearch provides official Docker images.
You can use these in combination with Kubernetes' native support for Docker to run Elasticsearch as a set of Docker containers in your cluster.

Conclusion : It gives you the most control, but requires more work to manage the Elasticsearch cluster
