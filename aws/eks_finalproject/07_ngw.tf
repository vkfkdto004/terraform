resource "aws_eip" "team3_eip" {
  domain = "vpc"
}
resource "aws_nat_gateway" "team3_ngw" {
  allocation_id = aws_eip.team3_eip.id
  subnet_id     = aws_subnet.eks_sub_controlplane1.id

  tags = {
    Name = "${var.name}-ngw"
  }
}

output "eip" {
  value = aws_eip.team3_eip.public_ip
}
