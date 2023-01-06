include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//RDS"
}

dependency "vpc" {
  config_path = find_in_parent_folders("VPC")
}

inputs = {
  env                    = "prod"
  sub_gb_name            = "prod_mysql_subnet_group"
  db_name                = "prod-db-instance-mysql"
  subnet_id              = dependency.vpc.outputs.private_subnet_ids
  vpc_security_group_ids = dependency.vpc.outputs.db_sg_id
}