#!/bin/bash

source ./access.sh

docker login -u $DockerUsername -p $DockerPassword

# # #Terraform - RDS
cd RDS-Terraform
terraform init
terraform apply -auto-approve
esc=$'\e'
address="$(terraform state show aws_db_instance.example |grep address | sed "s/address//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g" | sed "s/$esc\[[0-9;]*m//g" )"
cd ..

# # #Terraform - Quarkus Micro services changing the configuration of the DB connection, recompiling and packaging
cd Quarkus-project/src/main/resources
sed -i "/quarkus.datasource.reactive.url/d" application.properties
sed -i "/quarkus.container-image.group/d" application.properties
echo "quarkus.container-image.group=$DockerUsername" >> application.properties                                        
echo "quarkus.datasource.reactive.url=mysql://$address:3306/quarkus_test_all_operations" >> application.properties                                        
cd ../../..
DockerImage="$(grep -m 1 "<artifactId>" pom.xml|sed "s/<artifactId>//g"|sed "s/<\/artifactId>//g" |sed "s/\"//g" |sed "s/ //g" | sed "s/$esc\[[0-9;]*m//g")"
DockerImageVersion="$(grep -m 1 "<version>" pom.xml|sed "s/<version>//g"|sed "s/<\/version>//g" |sed "s/\"//g" |sed "s/ //g" | sed "s/$esc\[[0-9;]*m//g")"
./mvnw clean package
cd ..

cd Quarkus-Terraform
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

# # #Terraform - Camunda
cd Camunda-Terraform
terraform init
terraform apply -auto-approve
cd ..

# Showing all the PUBLIC_DNSs
echo CAMUNDA - 
cd Camunda-Terraform
terraform state show aws_instance.exampleInstallCamundaEngine |grep public_dns
echo "CAMUNDA IS AVAILABLE HERE:"
addressCamunda="$(terraform state show aws_instance.exampleInstallCamundaEngine |grep public_dns| sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g" | sed "s/$esc\[[0-9;]*m//g" )"
echo "http://"$addressCamunda":8080/camunda"
echo
cd ..

echo Quarkus - 
cd Quarkus-Terraform
terraform state show 'aws_instance.exampleDeployQuarkus' |grep public_dns
echo "MICROSERVICES ARE AVAILABLE HERE:"
addressMS="$(terraform state show aws_instance.exampleDeployQuarkus |grep public_dns | sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g" | sed "s/$esc\[[0-9;]*m//g" )"
echo "http://"$addressMS":8080/q/swagger-ui/"
echo
cd ..

echo RDS - 
cd RDS-Terraform
terraform state show aws_db_instance.example |grep address
terraform state show aws_db_instance.example |grep port
cd ..

echo GITHUB Image and Version - 
echo $DockerUsername/$DockerImage:$DockerImageVersion