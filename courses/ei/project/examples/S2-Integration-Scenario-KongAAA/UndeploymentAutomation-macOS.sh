#!/bin/bash


source ./access.sh

#Terraform 1 - Kong
cd KongTerraform
terraform destroy -auto-approve
cd ..

#Terraform 2 - Konga
cd KongaTerraform
terraform destroy -auto-approve
cd ..

# #Terraform 3 - Lambda
cd LambdaTerraform
terraform destroy -auto-approve
cd ..

# #Terraform 4 - Quarkus MS1
cd QuarkusTerraform
terraform destroy -auto-approve
cd ..



