resource "aws_subnet" "eks_sub_controlplane" {
  count                   = 2
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}${count.index == 0 ? "a" : "c"}"

  tags = {
    Name = "${var.name}-pub-${count.index == 0 ? "a" : "c"}"
  }

}
resource "aws_subnet" "eks_sub_worker" {
  count                   = 2
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.${count.index + 2}.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}${count.index == 0 ? "a" : "c"}"

  tags = {
    Name = "${var.name}-pri-${count.index == 0 ? "a" : "c"}"
  }
}
