## 1 Create a PostgreSQL Database

You can do that locally or on the Cloud.

Ex : https://www.elephantsql.com/

Ex : https://render.com/

## 2 Create another Terraform configuration file

In the directory with you main.tf file , create 2 another files

`db_config_x.tf`

`db_config.tfvars` with your DB credentials

## 3 Initializing Terraform.

Run the following command:

`terraform init`

We have introduced a new provider "kubernetes" in the db_config_x.tf file, we should run terraform init again.

## 4 Terraform validate

Run the following command:

`terraform validate`

This command is used to validate the configuration files in a directory.

It checks for syntax errors, internal inconsistencies, and other issues that might prevent Terraform operations.

## 5 Terraform plan

Run the following command:

`terraform plan`

This command is used to create an execution plan.

It determines what actions are necessary to achieve the desired state described by the Terraform configuration files.

## 6 Apply the Terraform configuration.

Run the following command:

`terraform apply`

This command applies the changes required to reach the desired state of the configuration,

or the pre-determined set of actions generated by a terraform plan execution plan.

## 7 Show the current state

Run the following command:

`terraform show`

This command displays the current state of your infrastructure as defined by our Terraform configuration 

and the actual state in your cloud provider (Minikube in your case).

