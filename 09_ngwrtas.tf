resource "aws_route_table_association" "wskim_ngwrtas_wasa" {
  subnet_id      = aws_subnet.wskim_wasa.id
  route_table_id = aws_route_table.wskim_ngwrt.id
}
resource "aws_route_table_association" "wskim_ngwrtas_wasc" {
  subnet_id      = aws_subnet.wskim_wasc.id
  route_table_id = aws_route_table.wskim_ngwrt.id
}
resource "aws_route_table_association" "wskim_ngwrtas_dba" {
  subnet_id      = aws_subnet.wskim_dba.id
  route_table_id = aws_route_table.wskim_ngwrt.id
}
resource "aws_route_table_association" "wskim_ngwrtas_dbc" {
  subnet_id      = aws_subnet.wskim_dbc.id
  route_table_id = aws_route_table.wskim_ngwrt.id
}
