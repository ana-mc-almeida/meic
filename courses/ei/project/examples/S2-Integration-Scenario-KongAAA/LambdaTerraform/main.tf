terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }
  required_version = "~> 1.2"
}

provider "aws" {
  region = "us-east-1"
} 

variable "bucketName" {
    type        = string
    description = "This is an example input variable using env variables."
}

variable "AWSAccountID" {
    type        = string
    description = "This is an example input variable using env variables."
}

## S3 PART
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.bucketName
}

 resource "aws_s3_object" "lambda_hello_world" {
   bucket = aws_s3_bucket.lambda_bucket.id
   key    = "lambda-java-example-0.0.1-SNAPSHOT.jar"
   source = "${path.module}/lambda-java-example-0.0.1-SNAPSHOT.jar"
 }

## LAMBDA FUNCTION PART
resource "aws_lambda_function" "hello_world" {
  function_name = "HelloWorld"
  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = aws_s3_object.lambda_hello_world.key
  runtime = "java11"
  handler = "example.Hello::handleRequest"
  role = "arn:aws:iam::${var.AWSAccountID}:role/LabRole"
}

resource "aws_cloudwatch_log_group" "hello_world" {
  name = "/aws/lambda/${aws_lambda_function.hello_world.function_name}"
  retention_in_days = 30
}

### API GATEWAY PART
resource "aws_api_gateway_rest_api" "example" {
  name        = "ServerlessExample"
  description = "Terraform Serverless Application Example"
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = "${aws_api_gateway_rest_api.example.id}"
  parent_id   = "${aws_api_gateway_rest_api.example.root_resource_id}"
  path_part   = "helloworldpath"
}

resource "aws_api_gateway_method" "proxy" {
  rest_api_id   = "${aws_api_gateway_rest_api.example.id}"
  resource_id   = "${aws_api_gateway_resource.proxy.id}"
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.example.id}"
  resource_id = "${aws_api_gateway_method.proxy.resource_id}"
  http_method = "${aws_api_gateway_method.proxy.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${aws_lambda_function.hello_world.invoke_arn}"
}

resource "aws_api_gateway_deployment" "example" {
  depends_on = [
    aws_api_gateway_integration.lambda
  ]

  rest_api_id = "${aws_api_gateway_rest_api.example.id}"
  stage_name  = "test"
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.hello_world.function_name}"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn = "${aws_api_gateway_rest_api.example.execution_arn}/*/*"
}

# Output value definitions
output "lambda_bucket_name" {
  description = "Name of the S3 bucket used to store function code."
  value = aws_s3_bucket.lambda_bucket.id
}

output "function_name" {
  description = "Name of the Lambda function."
  value = aws_lambda_function.hello_world.function_name
}

output "base_url" {
  value = "${aws_api_gateway_deployment.example.invoke_url}"
}