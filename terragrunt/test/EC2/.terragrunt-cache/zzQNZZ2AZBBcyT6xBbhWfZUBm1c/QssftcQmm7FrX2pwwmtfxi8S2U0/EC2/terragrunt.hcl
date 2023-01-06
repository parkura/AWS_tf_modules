include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//EC2" 
}

dependency "vpc" {
  config_path = find_in_parent_folders("VPC")
}

inputs = {
  ec2_name               = "test-web-ec2"
  instance_type          = "t2.nano"
  subnet_id              = dependency.vpc.outputs.private_subnet_ids
  vpc_security_group_ids = dependency.vpc.outputs.ec2_sg_id
}

/* dependencies {
  paths = ["../../../modules//VPC"]
} */