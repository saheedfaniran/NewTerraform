provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "EC2_Instance_creation" {
  cidr_block = "172.16.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "EC2_Instance_creation"
  }
}


#Create security group with firewall rules
resource "aws_security_group" "JenkinsSG2" {
  name        = "JenkinsSG2"
  description = "security group for jenkins"
                                        
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from Jenkins server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "my-ec2-instance"
  }
}

resource "aws_instance" "myFirstInstance" {
  ami           = "ami-0a695f0d95cefc163"
  key_name = "SaheedKey pair"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.JenkinsSG2.id]
  tags= {
    Name = "my-ec2-instance"
  }
}
