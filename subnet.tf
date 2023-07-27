resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.0.0/17"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1"
  tags = {
    Name = "web-subnet-1"
  }
}
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.128.0/18"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1"
  tags = {
    Name = "web-subnet-1"
  }
}
resource "aws_subnet" "app-subnet-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.192.0/19"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1"
  tags = {
    Name = "App-subnet-1"
  }
}
resource "aws_subnet" "app-subnet-2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.224.0/20"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1"
  tags = {
    Name = "App-subnet-2"
  }
}
resource "aws_subnet" "database-subnet-1" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "10.0.240.0/21"
  availability_zone = "ap-southeast-1"
  tags = {
    Name = "database-sn-1"
  }
}
resource "aws_subnet" "database-subnet-2" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "10.0.248.0/22"
  availability_zone = "ap-southeast-1"
  tags = {
    Name = "database-sn-2"
  }
}
resource "aws_subnet" "my-pub-sub" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.255.128/26"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1"
  tags = {
    Name = "my-pub"
  }
}
resource "aws_subnet" "my-pub" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.255.192/27"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1"
  tags = {
    Name = "my-pub-1"
  }
}
