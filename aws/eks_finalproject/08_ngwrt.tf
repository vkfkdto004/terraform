resource "aws_route_table" "team3_ngwrt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = var.rtcidr
    nat_gateway_id = aws_nat_gateway.team3_ngw.id
  }

  tags = {
    Name = "${var.name}-pri-rt"
  }

}
