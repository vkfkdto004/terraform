resource "aws_security_group" "eks_sg" {
  name   = "${var.name}-cluster"
  vpc_id = aws_vpc.eks_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.rtcidr]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.rtcidr]
  }
  tags = {
    Name = "${var.name}-sg"
  }
}
