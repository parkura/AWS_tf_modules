
output "rds_address" {
  value = aws_db_instance.mysql.address
}

output "rds_port" {
  value = aws_db_instance.mysql.port
}

output "rds_username" {
  value = aws_db_instance.mysql.username
}

output "rds_password" {
  value     = data.aws_ssm_parameter.rds_password.value
  sensitive = true
} 