# data "aws_ami" "wskim_ami" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-kernel 5.10-x86_64-gp2"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["amazon"]
# }

# output "ami_id" {
#     value = data.aws_ami.wskim_ami.image_id
# }

resource "aws_instance" "wskim_weba_ec2" {
  ami                         = "ami-084e92d3e117f7692"
  instance_type               = "t2.small"
  key_name                    = "wskim1"
  vpc_security_group_ids      = [aws_security_group.wskim_sg.id]
  availability_zone           = "ap-northeast-2a"
  associate_public_ip_address = true
  private_ip                  = "10.0.0.11"
  subnet_id                   = aws_subnet.wskim_weba.id

  tags = {
    Name = "wskim_weba_ec2"
  }
}

output "ec2_ip" {
  value = aws_instance.wskim_weba_ec2.public_ip
}
