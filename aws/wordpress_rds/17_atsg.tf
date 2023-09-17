resource "aws_autoscaling_group" "wskim_atsg" {
  name                      = "wskim-atsg"
  min_size                  = 1
  max_size                  = 6
  desired_capacity          = 1
  health_check_grace_period = 60
  health_check_type         = "EC2"
  force_delete              = false
  vpc_zone_identifier = [aws_subnet.wskim_weba.id,aws_subnet.wskim_webc.id]
  #vpc_zone_identifier = concat(aws_subnet.wskim_web[*].id)
  launch_template {
    id      = aws_launch_template.wskim_lt.id
    version = "$Latest"
  }
}
