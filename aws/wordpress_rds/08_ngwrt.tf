resource "aws_route_table" "wskim_ngwrt" {
  vpc_id = aws_vpc.wskim_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.wskim_ngw.id
  }

  tags = {
    Name = "wskim_ngwrt"
  }
}
