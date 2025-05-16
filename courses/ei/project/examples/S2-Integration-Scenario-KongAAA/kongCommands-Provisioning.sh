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

echo "----Starting the provisioning of the KONG commands -----"
echo "KONG SERVER = "$KONG_SERVER_ADDRESS
echo "QUARKUS URL 1 = "$QUARKUS1_URL
echo "QUARKUS URL 2 = "$QUARKUS2_URL
echo "QUARKUS URL 3 = "$QUARKUS3_URL
echo "QUARKUS URL 4 = "$QUARKUS4_URL
echo "LAMBDA URL = "$LAMBDA_URL


curl -i -X POST \
--url "http://${KONG_SERVER_ADDRESS}:8001/services/" \
--data "name=invoke-lambda-service" \
--data "url=${LAMBDA_URL}" \

curl -i -X POST \
--url "http://${KONG_SERVER_ADDRESS}:8001/services/" \
--data "name=invoke-quarkus1-service" \
--data "url=${QUARKUS1_URL}"\

curl -i -X POST \
--url "http://${KONG_SERVER_ADDRESS}:8001/services/" \
--data "name=invoke-quarkus2-service" \
--data "url=${QUARKUS2_URL}"\

curl -i -X POST \
--url "http://${KONG_SERVER_ADDRESS}:8001/services/" \
--data "name=invoke-quarkus3-service" \
--data "url=${QUARKUS3_URL}"\

curl -i -X POST \
--url "http://${KONG_SERVER_ADDRESS}:8001/services/" \
--data "name=invoke-quarkus4-service" \
--data "url=${QUARKUS4_URL}"

#create routes
curl -i -X POST \
--url "http://${KONG_SERVER_ADDRESS}:8001/services/invoke-lambda-service/routes" \
--data "hosts[]=serverlambda.com"

curl -i -X POST \
--url "http://${KONG_SERVER_ADDRESS}:8001/services/invoke-quarkus1-service/routes" \
--data "hosts[]=serverquarkus1.com"

curl -i -X POST \
--url "http://${KONG_SERVER_ADDRESS}:8001/services/invoke-quarkus2-service/routes" \
--data "hosts[]=serverquarkus2.com"

curl -i -X POST \
--url "http://${KONG_SERVER_ADDRESS}:8001/services/invoke-quarkus3-service/routes" \
--data "hosts[]=serverquarkus3.com"

curl -i -X POST \
--url "http://${KONG_SERVER_ADDRESS}:8001/services/invoke-quarkus4-service/routes" \
--data-urlencode "paths[]=~/fruits/(?<id>\d+)/(?<name>\S+)" \
--data "strip_path=false"


