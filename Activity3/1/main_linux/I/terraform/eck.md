## 1 A Create another Terraform configuration file

In the directory with you main.tf file , create 1 another file

`eck.tf`

## 2 Terraform validate

Run the following command:

`terraform validate`

This command is used to validate the configuration files in a directory.

It checks for syntax errors, internal inconsistencies, and other issues that might prevent Terraform operations.

## 3 Terraform plan

Run the following command:

`terraform plan`

This command is used to create an execution plan.

It determines what actions are necessary to achieve the desired state described by the Terraform configuration files.

## 4 Apply the Terraform configuration.

Run the following command:

`terraform apply`

This command applies the changes required to reach the desired state of the configuration,

or the pre-determined set of actions generated by a terraform plan execution plan.

## 5 Show the current state

Run the following command:

`terraform show`

This command displays the current state of your infrastructure as defined by our Terraform configuration 

and the actual state in your cloud provider (Minikube in your case).

## Notes 

To access this service from your local machine, you can use port forwarding with kubectl.
Here's how to do it:

`kubectl port-forward service/elasticsearch-es-http 9200`

Then, you can access Elasticsearch at http://localhost:9200. 

If you're using minikube, you can also use the minikube service command to access services:

`minikube service elasticsearch-es-http`