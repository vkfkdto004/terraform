resource "aws_route_table_association" "eks_rttaass1" {
  count          = 2
  subnet_id      = aws_subnet.eks_sub_controlplane[count.index].id
  route_table_id = aws_route_table.eks_rtta.id
}
resource "aws_route_table_association" "eks_rttaass2" {
  count          = 2
  subnet_id      = aws_subnet.eks_sub_worker[count.index].id
  route_table_id = aws_route_table.eks_rtta.id
}

