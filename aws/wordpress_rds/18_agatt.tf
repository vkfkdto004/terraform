resource "aws_autoscaling_attachment" "wskim_agatt" {
  autoscaling_group_name = aws_autoscaling_group.wskim_atsg.id
  lb_target_group_arn    = aws_lb_target_group.wskim_albtg.arn
}
