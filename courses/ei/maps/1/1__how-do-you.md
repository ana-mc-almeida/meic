# How do you? Specify the most relevant steps to perform the following task:

## Create an AWS EC2 Instance

1. **Sign in to AWS Console**: Go to the EC2 dashboard in the AWS Management Console.
2. **Click on 'Launch Instance'**: Choose the desired Amazon Machine Image (AMI), such as Amazon Linux, Ubuntu, or Windows.
3. **Choose Instance Type**: Select the instance type based on your needs (e.g., t2.micro for free tier).
4. **Configure Instance**: Choose the number of instances, VPC, subnet, and other configuration settings.
5. **Add Storage**: Specify storage size and type (e.g., SSD or HDD).
6. **Configure Security Group**: Set inbound and outbound rules (e.g., allow SSH (port 22) for Linux or RDP (port 3389) for Windows).
7. **Choose Key Pair**: Select an existing key pair or create a new one for SSH access.
8. **Review and Launch**: Review your settings and click 'Launch'.

## Create an AWS EC2 Image (AMI)

1. **Stop the EC2 Instance**: Go to the EC2 console, select the instance, and stop it.
2. **Create Image**: Right-click on the instance, select "Create Image" to create a new Amazon Machine Image (AMI).
3. **Configure Image**: Name the image, specify storage settings, and click "Create Image".
4. **Wait for Image Creation**: The image creation process may take several minutes.

## Change an AWS EC2 Instance Type

1. **Stop the EC2 Instance**: Go to the EC2 dashboard, select the instance, and click 'Stop'.
2. **Change Instance Type**: Select the 'Actions' dropdown, choose 'Instance Settings' → 'Change Instance Type', and select a new instance type.
3. **Start the EC2 Instance**: Once the instance type is changed, start the instance.

## Can You Change the AWS EC2 Image After Launching It?

No, once an EC2 instance is launched with a particular AMI, you cannot change the image after launch. However, you can:

- **Create a new AMI** from an existing instance by stopping it and creating an image.
- **Launch a new EC2 instance** with the desired AMI.

## Access Your AWS EC2 Instance Remotely (SSH, PuTTY, Key Pair, Network Inbound)

1. **Ensure Security Group Allows SSH**: Configure the inbound rule of the instance's security group to allow port 22 for SSH.
2. **Use Key Pair**: Ensure you have the private key corresponding to the key pair used when launching the instance.
3. **Find the Public IP Address**: Get the public IP address of your EC2 instance from the EC2 console.
4. **Access Using SSH** (Linux/macOS):

   ```bash
   ssh -i /path/to/key.pem ec2-user@<Public-IP>
   ```

   **Access Using PuTTY** (Windows):

   - Convert `.pem` to `.ppk` using PuTTYgen.
   - Open PuTTY, enter the public IP, and use the `.ppk` key for authentication.

## Upload Files to Your AWS EC2 Instance from Your Local Computer (SCP, FileZilla, Key Pair, Network Inbound)

1. **Ensure Security Group Allows SSH**: Make sure port 22 is open in the instance's security group.
2. **Use SCP (Linux/macOS)**:

   ```bash
   scp -i /path/to/key.pem /local/path/to/file ec2-user@<Public-IP>:/remote/path
   ```

3. **Use FileZilla (GUI)**:

   - Install FileZilla, configure it with the EC2 instance's public IP, set the SSH key (converted to `.ppk`), and transfer files.

## Configure Kafka to be Accessed Remotely

1. **Edit `server.properties` File**: Locate the Kafka configuration file (`server.properties`).
2. **Set `listeners`**: Modify the `listeners` property to bind Kafka to a public IP address (e.g., `listeners=PLAINTEXT://0.0.0.0:9092`).
3. **Set `advertised.listeners`**: Set the `advertised.listeners` to the public IP of the server (e.g., `advertised.listeners=PLAINTEXT://<Public-IP>:9092`).
4. **Update Security Group**: Allow inbound access on port 9092 (Kafka's default port) in the EC2 instance's security group.
5. **Restart Kafka**: Restart the Kafka broker for changes to take effect.

### What are you changing?

TODO

## Upload a File to a New EC2 Instance Using Terraform

1. **Use `file` Provisioner**: In your Terraform configuration, use the `file` provisioner to upload a file.

   ```hcl
   resource "aws_instance" "example" {
     ami           = "ami-12345678"
     instance_type = "t2.micro"

     provisioner "file" {
       source      = "path/to/local/file"
       destination = "/remote/path/on/instance"
     }
   }
   ```

2. **Apply Terraform**: Run `terraform apply` to create the instance and upload the file.

## Execute a Script File into a New EC2 Instance Using Terraform

1. **Use `remote-exec` Provisioner**: In your Terraform configuration, use the `remote-exec` provisioner to execute a script.

   ```hcl
   resource "aws_instance" "example" {
     ami           = "ami-12345678"
     instance_type = "t2.micro"

     provisioner "remote-exec" {
       inline = [
         "bash /path/to/script.sh"
       ]
     }
   }
   ```

2. **Apply Terraform**: Run `terraform apply` to create the instance and execute the script.

## Specify an Inbound Port into a New EC2 Instance Using Terraform

1. **Modify Security Group in Terraform**: Create or update a security group to allow inbound traffic on the desired port.

   ```hcl
   resource "aws_security_group" "example" {
     name        = "example-sg"
     description = "Allow inbound traffic"

     ingress {
       from_port   = 80
       to_port     = 80
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
     }
   }
   ```

2. **Attach Security Group to EC2**: Attach the security group to the EC2 instance in your Terraform configuration.

## Specify an Outbound Port into a New EC2 Instance Using Terraform

1. **Modify Security Group in Terraform**: Define an outbound rule to allow traffic to the desired port.

   ```hcl
   resource "aws_security_group" "example" {
     name        = "example-sg"
     description = "Allow outbound traffic"

     egress {
       from_port   = 443
       to_port     = 443
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
     }
   }
   ```

2. **Attach Security Group to EC2**: Attach the security group to the EC2 instance in your Terraform configuration.

## Specify a Tag Name into a New EC2 Instance Using Terraform

1. **Add `tags` Block in Terraform**: Specify tags for your EC2 instance.

   ```hcl
   resource "aws_instance" "example" {
     ami           = "ami-12345678"
     instance_type = "t2.micro"

     tags = {
       Name = "My-EC2-Instance"
     }
   }
   ```

2. **Apply Terraform**: Run `terraform apply` to create the EC2 instance with the specified tags.

## Create Multiple New EC2 Instances Using Terraform

1. **Use `count` Parameter in Terraform**: Specify the number of instances using the `count` parameter.

   ```hcl
   resource "aws_instance" "example" {
     ami           = "ami-12345678"
     instance_type = "t2.micro"
     count         = 3  # Creates 3 EC2 instances
   }
   ```

2. **Apply Terraform**: Run `terraform apply` to create multiple EC2 instances.
