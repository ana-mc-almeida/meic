terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["aws_credentials"]
}
resource "aws_instance" "exampleFileTransfer" {
  ami                    = "ami-045269a1f5c90a6a0"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name               = "vockey"
  tags = {
    Name = "terraform-example"
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("labsuser.pem")
    host        = self.public_dns
  }
  provisioner "file" {
    source      = "kafka_2.13-3.9.0.tgz"
    destination = "/home/ec2-user/kafka_2.13-3.9.0.tgz"
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
}
variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "terraform-example-instance"
}
