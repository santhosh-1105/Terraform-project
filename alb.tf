resource "aws_lb" "external-alb" {
  name               = "External-LoadBalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demosg.id]
  subnets            = [aws_subnet.public-subnet.id, aws_subnet.public-subnet-1.id]
}
resource "aws_lb_target_group" "target-elb" {
  name     = "ALB-TargetGroup"
  protocol = "HTTP"
  port     = 80
  vpc_id   = aws_vpc.my-vpc.id
}
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.target-elb.arn
  target_id        = aws_instance.ec2_hello[0].id
  port             = 80
  depends_on = [aws_instance.ec2_hello,
  ]
}
resource "aws_lb_target_group_attachment" "connect" {
  target_group_arn = aws_lb_target_group.target-elb.arn
  target_id        = aws_instance.ec2_hello_2[0].id
  port             = 80
  depends_on = [aws_instance.ec2_hello_2,
  ]
}
resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
   type             = "forward"
    target_group_arn = aws_lb_target_group.target-elb.arn

  }
}
