resource "aws_lb_listener" "wskim_alblsn" {
  load_balancer_arn = aws_lb.wskim_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wskim_albtg.arn
  }

}
