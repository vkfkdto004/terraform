resource "aws_route_table" "wskim_rt" {
  vpc_id = aws_vpc.wskim_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wskim_igw.id
  }
  tags = {
    Name = "wskim_rt"
  }

}
