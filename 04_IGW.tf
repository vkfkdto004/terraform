resource "aws_internet_gateway" "wskim_igw" {
  vpc_id = aws_vpc.wskim_vpc.id
  tags = {
    Name = "wskim_igw"
  }
}