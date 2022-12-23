//Generate Password
resource "random_password" "main" {
  length           = 20
  special          = true
  override_special = "#!()_"
}

// Store Password
resource "aws_ssm_parameter" "rds_password" {
  name        = var.ssm_settings["name"]
  description = var.ssm_settings["description"]
  type        = var.ssm_settings["type"]
  value       = random_password.main.result
}

// Retrieve Password
data "aws_ssm_parameter" "rds_password" {
  name       = var.db_ssm_pass_name
  depends_on = [aws_ssm_parameter.rds_password]
}
