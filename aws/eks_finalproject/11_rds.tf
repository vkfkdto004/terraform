resource "aws_db_subnet_group" "team3_dbsubg" {
  name       = "${var.name}-dbsubg"
  subnet_ids = [aws_subnet.db_suba.id, aws_subnet.db_subc.id]
}

resource "aws_db_instance" "team3_db" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  db_name                = "wordpress"
  identifier             = "mydb"
  username               = "admin"
  password               = "It12345!"
  parameter_group_name   = "default.mysql8.0"
  availability_zone      = "ap-northeast-2a"
  db_subnet_group_name   = aws_db_subnet_group.team3_dbsubg.id
  vpc_security_group_ids = [aws_security_group.team3_sg.id]
  skip_final_snapshot    = true

  tags = {
    Name = "${var.name}-db"
  }
}
