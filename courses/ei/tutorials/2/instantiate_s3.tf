terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "terraform-s3-2025-05-05"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"
    # access_key = "ACCESS_KEY"
    # secret_key = "SECRET_KEY"
    # token      = "TOKEN"
    shared_credentials_files = ["aws_credentials"]
  }
}
provider "aws" {
  region = "us-east-1"
  # access_key = "ACCESS_KEY"
  # secret_key = "SECRET_KEY"
  # token      = "TOKEN"
  shared_credentials_files = ["aws_credentials"]

}
resource "aws_instance" "exampleCluster" {
  ami                    = "ami-045269a1f5c90a6a0"
  instance_type          = "t2.small"
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name               = "vockey"
  user_data = base64encode(templatefile("creation-2.sh", {
    address = data.terraform_remote_state.db.outputs.address
    port    = data.terraform_remote_state.db.outputs.port
  }))
  user_data_replace_on_change = true
  tags = {
    Name = "terraform-example-sharestate"
  }
}
resource "aws_security_group" "instance" {
  name = var.security_group_name
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "terraform-example-instance2"
}
