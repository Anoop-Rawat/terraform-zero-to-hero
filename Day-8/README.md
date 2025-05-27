# MIGRATION TO TERRAFORM & DRIFT DETECTION

https://youtu.be/-4IMy5ihiiU


Scenario 1: You have existing aws infra and you need to import it into terraform (or migrate into terraform)

Create terraform project with provider and import block eg below

provider "aws" {
  region = "us-east-1"
}


import {
     id = "i-02b165cf9fa96352c"
     to = aws_instance.example   
 }

Run below command to get resource information

terraform init
terraform plan -generate-config-out="generated_resource.tf"

Above command generate file name generated_resource.tf , copy the resource information from there and past in your main terrraform project. 
Now you are good to delete import block from your terraform project and also good to delete generated_resource.tf file

Now run below command to generate terraform.tfstate file

terraform import aws_instance.example i-02b165cf9fa96352c

Now , you have successfully migrated your infra to terraform, you can verify it by terraform plan command.







