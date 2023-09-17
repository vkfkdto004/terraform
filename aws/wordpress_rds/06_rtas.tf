resource "aws_route_table_association" "wskim_rtasa" {
  subnet_id      = aws_subnet.wskim_weba.id
  route_table_id = aws_route_table.wskim_rt.id
}
resource "aws_route_table_association" "wskim_rtasc" {
  subnet_id      = aws_subnet.wskim_webc.id
  route_table_id = aws_route_table.wskim_rt.id
}
