resource "aws_route_table" "route" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demogateway.id
  }
  tags = {
    Name = "route to internet"
  }
}
resource "aws_route_table_association" "rt11" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.route.id
}
resource "aws_route_table_association" "rt22" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "rt33" {
  subnet_id      = aws_subnet.my -pub-sub.id
  route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "rt44" {
  subnet_id      = aws_subnet.my-pub.id
  route_table_id = aws_route_table.route.id
}
