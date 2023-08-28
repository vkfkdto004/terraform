resource "aws_eip" "wskim_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "wskim_ngw" {
  allocation_id = aws_eip.wskim_eip.id
  subnet_id     = aws_subnet.wskim_weba.id

  tags = {
    Name = "wskim_ngw"
  }
}

output "eip" {
    value = aws_eip.wskim_eip.public_ip
}