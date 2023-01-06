include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//ALB"
}

dependency "vpc" {
  config_path = find_in_parent_folders("VPC")
}

dependency "ec2" {
  config_path = find_in_parent_folders("EC2")
}


inputs = {
  subnets         = dependency.vpc.outputs.private_subnet_ids
  vpc_id          = dependency.vpc.outputs.vpc_id
  security_groups = dependency.vpc.outputs.alb_sg_id
  instance_id     = dependency.ec2.outputs.instance_id
}