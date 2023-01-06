output "rds_address" {
  description = "DB instance address." //dev-db-mysql-5-7.c35ejmaepxka.us-east-1.rds.amazonaws.com
  value       = aws_db_instance.mysql.address
}

output "rds_port" {
  description = "DB instance port number."
  value       = aws_db_instance.mysql.port
}

output "rds_username" {
  description = "DB instance username." //admin
  value       = aws_db_instance.mysql.username
}

output "rds_password" {
  description = "DB instance password."
  value       = data.aws_ssm_parameter.rds_password.value
  sensitive   = true
}