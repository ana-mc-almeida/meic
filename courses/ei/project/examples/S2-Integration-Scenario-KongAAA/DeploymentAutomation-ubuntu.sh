#!/bin/bash

# a docker image that is a part of SCENARIO 1 is required, thus you should execute scenario 1 before scenario 2

source ./access.sh
esc=$'\e'

# #Terraform 1 - Kong
cd KongTerraform
terraform init
terraform apply -auto-approve
cd ..

# #Terraform 2 - Konga
cd KongaTerraform
terraform init
terraform apply -auto-approve
cd ..

# # #Terraform 3 - Lambda
cd LambdaTerraform
terraform init
terraform apply -auto-approve
cd ..

# # #Terraform 4 - Quarkus MS1
cd QuarkusTerraform
# Add all the dynamic access informastion to docker hub
sed -i "/sudo docker login/d" quarkus.sh
sed -i "/sudo docker pull/d" quarkus.sh
sed -i "/sudo docker run/d" quarkus.sh
echo "sudo docker login -u \"$DockerUsername\" -p \"$DockerPassword\"" >> quarkus.sh
echo "sudo docker pull $DockerUsername/$DockerImage:$DockerImageVersion" >> quarkus.sh
echo "sudo docker run -d --name $DockerImage -p 8080:8080 $DockerUsername/$DockerImage:$DockerImageVersion" >> quarkus.sh
terraform init
terraform taint aws_instance.exampleDeployQuarkus
terraform apply -auto-approve
cd ..



echo "KONG IS AVAILABLE HERE:" 
cd KongTerraform
addressKong="$(terraform state show aws_instance.exampleInstallKong |grep public_dns | sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g" | sed "s/$esc\[[0-9;]*m//g" )"
echo ""$addressKong":8000/"
echo
cd ..

echo "KONGA IS AVAILABLE HERE:"
cd KongaTerraform
addressKonga="$(terraform state show aws_instance.exampleInstallKonga |grep public_dns | sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g" | sed "s/$esc\[[0-9;]*m//g" )"
echo "http://"$addressKonga":1337/"
echo
cd ..

echo "LAMBDA IS AVAILABLE HERE:" 
cd LambdaTerraform
pathlambda="$(terraform state show aws_api_gateway_resource.proxy | grep path_part | sed "s/path_part//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g")"
invokeurllambda="$(terraform state show aws_api_gateway_deployment.example | grep invoke_url | sed "s/invoke_url//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g"  )"
echo $invokeurllambda"/"$pathlambda
echo
cd ..

echo "QUARKUS MICROSERVICES ARE AVAILABLE HERE:"  
cd QuarkusTerraform
pathQ0="$(terraform state show 'aws_instance.exampleDeployQuarkus[0]' |grep public_dns | sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g")"
pathQ1="$(terraform state show 'aws_instance.exampleDeployQuarkus[1]' |grep public_dns | sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g")"
pathQ2="$(terraform state show 'aws_instance.exampleDeployQuarkus[2]' |grep public_dns | sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g")"
echo "http://"$pathQ0":8080/fruits"
echo "http://"$pathQ1":8080/fruits"
echo "http://"$pathQ2":8080/fruits"
echo "http://"$pathQ0":8080/q/swagger-ui/"
echo "http://"$pathQ1":8080/q/swagger-ui/"
echo "http://"$pathQ2":8080/q/swagger-ui/"
echo
cd ..


