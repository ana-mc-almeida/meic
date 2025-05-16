#!/bin/bash
echo "Starting..."

sudo yum update -y

sudo yum install -y docker

sudo service docker start
