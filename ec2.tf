resource "aws_instance" "ec2_hello" {
ami ="ami-09964535fc01efa5f"
instance_type = "t2.micro"
count = 1
key_name = "santhosh1"
vpc_security_group_ids = [aws_security_group.demosg.id]
subnet_id = aws_subnet.my-pub-sub.id
associate_public_ip_address = true
 user_data = "${file("data.sh")}"


    tags = {
      Name = "ec2_hello"
    }
}

resource "aws_instance" "ec2_hello_2" {
ami ="ami-09964535fc01efa5f"
instance_type = "t2.micro"
count = 1
key_name = "santhosh1"
vpc_security_group_ids = [aws_security_group.demosg.id]
subnet_id = aws_subnet.my-pub.id
associate_public_ip_address = true
user_data = "${file("data.sh")}"


    tags = {
      Name = "ec2_hello_2"
    }
}
