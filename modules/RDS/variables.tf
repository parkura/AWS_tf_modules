variable "db_name" {
  description = "The name of the DB instance."
  type        = string
  default     = "dev-db-mysql-5-7"
}

variable "tags" {
  description = "db instance tags."
  type = map
  default = {
    Name = "mysql"
    env  = "dev"
  }
}

variable "vpc_security_group_ids" {
  description = "The security group ID of the DB instance."
  type        = string
}

variable "sub_gb_name" {
  description = "DB Subnet group name."
  type        = string
  default     = "main"
}

variable "subnet_id" {
  description = "The private subnet IDs for the DB instance."
  type        = list(any)
}

variable "db_ssm_pass_name" {
  description = "The private subnet IDs for the DB instance."
  type        = string
  default     = "mysql-rds-password"
}

variable "db_settings" {
  description = "aws_db_instance settings."
  type        = map(string)
  default = {
    "allocated_storage"    = 20
    "storage_type"         = "gp2"
    "engine"               = "mysql"
    "engine_version"       = "5.7"
    "instance_class"       = "db.t2.micro"
    "parameter_group_name" = "default.mysql5.7"
    "username"             = "admin"
  }
}

variable "ssm_settings" {
  description = "Name, description and type for the ssm parameter store."
  type        = map(string)
  default = {
    "name"          = "mysql-rds-password"
    "description"   = "Master Password for RDS Database"
    "type"          = "SecureString"
  }
}