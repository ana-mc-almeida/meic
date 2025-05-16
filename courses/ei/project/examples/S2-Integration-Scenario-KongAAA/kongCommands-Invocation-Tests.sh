#!/bin/bash

# create a service for each endpoint
cd QuarkusTerraform
QUARKUS1_URL="http://$(terraform state show 'aws_instance.exampleDeployQuarkus[0]' |grep public_dns | sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g"):8080/fruits"
QUARKUS2_URL="http://$(terraform state show 'aws_instance.exampleDeployQuarkus[1]' |grep public_dns | sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g"):8080/fruits"
QUARKUS3_URL="http://$(terraform state show 'aws_instance.exampleDeployQuarkus[2]' |grep public_dns | sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g"):8080/fruits"
QUARKUS4_URL="http://$(terraform state show 'aws_instance.exampleDeployQuarkus[2]' |grep public_dns | sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g"):8080/"
cd ..

cd KongTerraform
KONG_SERVER_ADDRESS="$(terraform state show aws_instance.exampleInstallKong |grep public_dns | sed "s/public_dns//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g" | sed "s/$esc\[[0-9;]*m//g" )"
cd ..

cd LambdaTerraform
pathlambda="$(terraform state show aws_api_gateway_resource.proxy | grep path_part | sed "s/path_part//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g")"
invokeurlambda="$(terraform state show aws_api_gateway_deployment.example | grep invoke_url | sed "s/invoke_url//g" | sed "s/=//g" | sed "s/\"//g" |sed "s/ //g"  )"
LAMBDA_URL=$invokeurlambda"/"$pathlambda
cd  ..

#invoke
curl -i -X POST -H "Content-Type: json;charset=UTF-8" \
--url "http://${KONG_SERVER_ADDRESS}:8000/" \
--header "Host: serverlambda.com" \
--data "@body.json"

curl -i -X GET \
--url "http://${KONG_SERVER_ADDRESS}:8000/" \
--header "Host: serverquarkus1.com" 

curl -i -X GET \
--url "http://${KONG_SERVER_ADDRESS}:8000/" \
--header "Host: serverquarkus2.com" 

curl -i -X GET \
--url "http://${KONG_SERVER_ADDRESS}:8000/" \
--header "Host: serverquarkus3.com" 

curl -v -i -X PUT -H "accept: application/json" \
--url "http://${KONG_SERVER_ADDRESS}:8000/fruits/2/newfruittotest" 
