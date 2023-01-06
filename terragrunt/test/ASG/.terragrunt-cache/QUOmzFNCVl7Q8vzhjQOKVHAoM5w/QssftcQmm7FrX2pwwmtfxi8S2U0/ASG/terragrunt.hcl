include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//ASG"
}

dependency "vpc" {
  config_path = find_in_parent_folders("VPC")
}

dependency "alb" {
  config_path = find_in_parent_folders("ALB")
}

inputs = {
  subnets             = dependency.vpc.outputs.private_subnet_ids
  security_groups     = dependency.vpc.outputs.alb_sg_id
  lb_target_group_arn = dependency.alb.outputs.lb_target_group_arn
}

/* dependencies {
  paths = ["../../../modules//VPC", "../../../modules//EC2", "../../../modules//ALB"]
} */