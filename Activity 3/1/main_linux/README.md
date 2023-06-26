There are multiple ways to set up Elasticsearch and connect it with your Kubernetes cluster :

Manual Deployment Using Kubernetes Manifests: 
This involves writing Kubernetes manifest files (YAML or JSON) for Elasticsearch and using kubectl apply to create the resources.

Helm Chart: 
Helm is a package manager for Kubernetes, and Elasticsearch has an official Helm chart.

Elastic Cloud on Kubernetes (ECK):
Elasticsearch provides their own official Kubernetes Operator called ECK (Elastic Cloud on Kubernetes), which simplifies the deployment and operation of Elasticsearch on Kubernetes.
This Operator allows you to declaratively manage and orchestrate Elasticsearch deployments, as well as Kibana and APM Server deployments.

Use Elasticsearch Docker Images:
Elasticsearch provides official Docker images.
You can use these in combination with Kubernetes' native support for Docker to run Elasticsearch as a set of Docker containers in your cluster.
