resource "aws_ami_from_instance" "wskim_ami" {
  name               = "wskim-ami"
  source_instance_id = aws_instance.wskim_weba_ec2.id
  depends_on = [
    aws_instance.wskim_weba_ec2
  ]
  tags = {
    Name = "wskim-ami"
  }
}
