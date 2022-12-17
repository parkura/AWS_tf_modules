
data "aws_security_group" "mysql_sg"{
  name = "allow-3306-mysql"
}  

resource "aws_db_subnet_group" "mysql" {
  name       = "main"
  subnet_ids = var.subnet_id[*]

  tags = {
    Name = "Mysql subnet group"
  }
}

resource "aws_db_instance" "mysql" {
  identifier           = var.db_name
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = aws_db_subnet_group.mysql.id
  vpc_security_group_ids = [data.aws_security_group.mysql_sg.id]
  skip_final_snapshot  = true
  apply_immediately    = true
  username             = "admin"
  password             = data.aws_ssm_parameter.rds_password.value
}
 