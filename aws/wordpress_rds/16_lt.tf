resource "aws_launch_template" "wskim_lt" {
  name = "wskim-lt"
  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = 10
      volume_type = "gp2"
    }
  }
  image_id               = aws_ami_from_instance.wskim_ami.id
  instance_type          = "t2.micro"
  key_name               = "wskim1"
  vpc_security_group_ids = [aws_security_group.wskim_sg.id]
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "wskim-lt"
    }
  }
  #  user_data = filebase64("${path.module}/install.sh")
}
