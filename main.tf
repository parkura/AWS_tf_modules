terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.47"
    }

   random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }


  }
}

provider "aws" {
  region = var.region
}

module "aws_s3_bucket" {
  source = "./modules/S3"
}

module "aws_vpc_dev" {
  source = "./modules/VPC"
}

module "aws_ec2_dev" {
  depends_on = [module.aws_vpc_dev]
  source     = "./modules/EC2"
  subnet_id  = module.aws_vpc_dev.private_subnet_ids
}
 
module "aws_alb_dev" {
  depends_on  = [module.aws_vpc_dev, module.aws_ec2_dev]
  source      = "./modules/ALB"
  subnets     = module.aws_vpc_dev.public_subnet_ids
  vpc_id      = module.aws_vpc_dev.vpc_id
  instance_id = module.aws_ec2_dev.instance_id
}

module "aws_rds_dev" {
  depends_on = [module.aws_vpc_dev]
  source     = "./modules/RDS"
  subnet_id  = module.aws_vpc_dev.private_subnet_ids
} 

module "aws_asg_dev" {
  depends_on = [module.aws_vpc_dev, module.aws_ec2_dev, module.aws_alb_dev]
  source     = "./modules/ASG"
  subnets    = module.aws_vpc_dev.private_subnet_ids
} 
