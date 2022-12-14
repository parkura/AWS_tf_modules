

/* //Generate Password
resource "random_password" "main" {
  length           = 20
  special          = true #   Default: !@#$%&*()-_=+[]{}<>:?
  override_special = "#!()_"
}

// Store Password
resource "aws_ssm_parameter" "rds_password" {
  name        = "/prod/prod-mysql-rds/password"
  description = "Master Password for RDS Database"
  type        = "SecureString"
  value       = random_password.main.result
}

// Retrieve Password
data "aws_ssm_parameter" "rds_password" {
  name       = "/prod/prod-mysql-rds/password"
  depends_on = [aws_ssm_parameter.rds_password]
} */
