resource "aws_lb" "wskim_alb" {
  name               = "wskim-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.wskim_sg.id]
  subnets            = [aws_subnet.wskim_weba.id, aws_subnet.wskim_webc.id]

  tags = {
    Name = "wskim_alb"
  }
}

output "alb_dns_name" {
  value = aws_lb.wskim_alb.dns_name

}
