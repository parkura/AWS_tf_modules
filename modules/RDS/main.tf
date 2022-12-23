//Create subnet group for mysql db instance
resource "aws_db_subnet_group" "mysql" {
  name       = var.sub_gb_name
  subnet_ids = var.subnet_id[*]
  tags       = var.tags
}

//Create mysql db instance
resource "aws_db_instance" "mysql" {
  identifier             = var.db_name
  allocated_storage      = var.db_settings["allocated_storage"]
  storage_type           = var.db_settings["storage_type"]
  engine                 = var.db_settings["engine"]
  engine_version         = var.db_settings["engine_version"]
  instance_class         = var.db_settings["instance_class"]
  parameter_group_name   = var.db_settings["parameter_group_name"]
  db_subnet_group_name   = aws_db_subnet_group.mysql.id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  skip_final_snapshot    = true
  apply_immediately      = true
  username               = var.db_settings["username"]
  password               = data.aws_ssm_parameter.rds_password.value
  tags                   = var.tags
}
 