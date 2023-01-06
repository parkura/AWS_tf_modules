include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//VPC"
}

inputs = {
  public_subnet_cidrs  = [ "10.100.7.0/24", "10.100.8.0/24" ]
  private_subnet_cidrs = [ "10.100.9.0/24", "10.100.10.0/24" ]
  vpc_cidr             = "10.100.0.0/16"
}