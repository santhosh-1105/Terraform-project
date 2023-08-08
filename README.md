# Terraform-project
intern
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc"
  }
}
resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.0/17"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "pub-2"
  }
}
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.128.0/18"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1b"
  tags = {
    Name = "pub-1"
  }
}
resource "aws_subnet" "prvt-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.192.0/19"
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "prvt-1"
  }
}
resource "aws_subnet" "prvt-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.224.0/20"
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1b"
  tags = {
    Name = "prvt-2"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id
}
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
  tags = {
    Name = "pub"
  }
}
resource "aws_route_table_association" "rt" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.route.id
}
resource "aws_route_table_association" "rt2" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "rt3" {
  subnet_id      = aws_subnet.prvt-subnet-1.id
  route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "rt4" {
  subnet_id      = aws_subnet.prvt-subnet-2.id
  route_table_id = aws_route_table.route.id
}
resource "aws_route_table" "prvt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
  tags = {
    Name = "prvt-rt"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.27"
    }
  }
}



provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIARUEMFSU6NZ3T57KL"
  secret_key = "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"
}
resource "aws_security_group" "SG" {
  vpc_id = "${aws_vpc.vpc.id}"

  # Inbound Rules

  # HTTP acess from any where
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTPS access from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 7000
    to_port     = 7000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules

  # Internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
resource "aws_instance" "pub" {
ami ="ami-09964535fc01efa5f"
instance_type = "t2.micro"
count = 1
key_name = "santhosh1"
vpc_security_group_ids = [aws_security_group.demosg.id]
subnet_id = aws_subnet.public-subnet.id
associate_public_ip_address = true
 user_data = "${file("data.sh")}"


    tags = {
      Name = "pub"
    }
}

resource "aws_instance" "prvt" {
ami ="ami-09964535fc01efa5f"
instance_type = "t2.micro"
count = 1
key_name = "santhosh1"
vpc_security_group_ids = [aws_security_group.SG.id]
subnet_id = aws_subnet.public-subnet-1.id
associate_public_ip_address = true
user_data = "${file("data.sh")}"


    tags = {
      Name = "prvt"
    }
}
 
