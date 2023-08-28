resource "aws_subnet" "wskim_weba" {
  vpc_id            = aws_vpc.wskim_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "wskim_weba"
  }
}

resource "aws_subnet" "wskim_webc" {
  vpc_id            = aws_vpc.wskim_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "wskim_webc"
  }
}

resource "aws_subnet" "wskim_wasa" {
  vpc_id            = aws_vpc.wskim_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "wskim_wasa"
  }
}

resource "aws_subnet" "wskim_wasc" {
  vpc_id            = aws_vpc.wskim_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "wskim_wasc"
  }
}

resource "aws_subnet" "wskim_dba" {
  vpc_id            = aws_vpc.wskim_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "wskim_dba"
  }
}

resource "aws_subnet" "wskim_dbc" {
  vpc_id            = aws_vpc.wskim_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "wskim_dbc"
  }
}
