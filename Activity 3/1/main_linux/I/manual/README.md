Manual Instructions : 

Run the following command : 

`kubectl create -f https://download.elastic.co/downloads/eck/2.8.0/crds.yaml`

`kubectl apply -f https://download.elastic.co/downloads/eck/2.8.0/operator.yaml`

`kubectl apply -f elasticsearch.yaml`

After the cluster is ready, you can check its status with the following command: 

`kubectl get elasticsearch`

In order to connect to the Elasticsearch instance, you'll need to get the automatically generated password for the built-in elastic user :
