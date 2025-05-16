#!/bin/bash
source ./access.sh


# #Terraform - Quarkus MS1
cd Quarkus-Terraform
terraform destroy -auto-approve
cd ..

# #Terraform - RDS
cd RDS-Terraform
terraform destroy -auto-approve
cd ..

# #Terraform - Camunda
cd Camunda-Terraform
terraform destroy -auto-approve
cd ..
