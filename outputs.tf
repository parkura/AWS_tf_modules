
#VPC outputs	
output "vpc_id" {
  value = module.aws_vpc_dev.vpc_id
}

output "vpc_cidr" {
  value = module.aws_vpc_dev.vpc_cidr
}

output "public_subnet_ids" {
  value = module.aws_vpc_dev.private_subnet_ids
}

output "private_subnet_ids" {
  value = module.aws_vpc_dev.private_subnet_ids
}

output "aviability_zones" {
  value = module.aws_vpc_dev.availability_zones
}

output "common_tags" {
  value = module.aws_vpc_dev.common_tags
}

#EC2 outputs
output "instance_id" {
  value = module.aws_ec2_dev.instance_id
}

output "instance_ami" {
  value = module.aws_ec2_dev.instance_ami
}


#ALB output
output "Application-LB-URL" {
  value = module.aws_alb_dev.Application-LB-URL
}

output "target_group_arns" {
  value = module.aws_alb_dev.target_group_arns
} 


#ASG output
output "autoscaling_group_name" {
  value = module.aws_asg_dev.autoscaling_group_name
}


#RDS output
 
output "rds_username" {
  value = module.aws_rds_dev.rds_username
}

output "rds_address" {
  value = module.aws_rds_dev.rds_address
}

output "rds_port" {
  value = module.aws_rds_dev.rds_port
}

output "rds_password" {
  value     = module.aws_rds_dev.rds_password
  sensitive = true
} 