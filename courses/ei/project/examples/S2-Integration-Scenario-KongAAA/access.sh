#!/bin/bash

# aws access variables 
aws_access_key_id=
aws_secret_access_key=
aws_session_token=
awsAccountID=
bucketName="bucket-20250206"

# docker access variables
yourDockerUsername=
yourDockerPassword=
yourDockerImage=scenario1
yourDockerImageVersion=1.0.0-SNAPSHOT

# exporting all variables to be used by next scripts
export DockerUsername=$yourDockerUsername
export DockerPassword=$yourDockerPassword
export AWS_ACCESS_KEY_ID=$aws_access_key_id
export AWS_SECRET_ACCESS_KEY=$aws_secret_access_key
export AWS_SESSION_TOKEN=$aws_session_token
export TF_VAR_AWSAccountID=$awsAccountID
export TF_VAR_bucketName=$bucketName
export DockerImage=$yourDockerImage
export DockerImageVersion=$yourDockerImageVersion

