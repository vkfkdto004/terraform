# resource "aws_subnet" "eks_sub_controlplane" {
#   count                   = 2
#   vpc_id                  = aws_vpc.eks_vpc.id
#   cidr_block              = "10.0.${count.index}.0/24"
#   map_public_ip_on_launch = true
#   availability_zone       = "${var.region}${count.index == 0 ? "a" : "c"}"

#   tags = {
#     Name = "${var.name}-pub-${count.index == 0 ? "a" : "c"}"
#   }

# }
# resource "aws_subnet" "eks_sub_worker" {
#   count                   = 2
#   vpc_id                  = aws_vpc.eks_vpc.id
#   cidr_block              = "10.0.${count.index + 2}.0/24"
#   map_public_ip_on_launch = true
#   availability_zone       = "${var.region}${count.index == 0 ? "a" : "c"}"

#   tags = {
#     Name = "${var.name}-pri-${count.index == 0 ? "a" : "c"}"
#   }
# }

resource "aws_subnet" "eks_sub_controlplane1" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-pub-2a"
  }
}

resource "aws_subnet" "eks_sub_controlplane2" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-pub-2c"
  }
}

resource "aws_subnet" "eks_sub_worker1" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-pri-2a"
  }
}

resource "aws_subnet" "eks_sub_worker2" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-pri-2c"
  }
}
resource "aws_subnet" "db_suba" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "${var.name}_dba"
  }
}

resource "aws_subnet" "db_subc" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "${var.name}-dbc"
  }
}
