#VPC outputs	
output "vpc_name" {
  value = module.aws_vpc_dev.vpc_name
}

output "vpc_id" {
  value = module.aws_vpc_dev.vpc_id
}

output "vpc_cidr" {
  value = module.aws_vpc_dev.vpc_cidr
}

output "public_subnet_ids" {
  value = module.aws_vpc_dev.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.aws_vpc_dev.private_subnet_ids
}

output "aviability_zones" {
  value = module.aws_vpc_dev.aviability_zones
}

output "security_group_ids" {
  value = module.aws_vpc_dev.security_group_ids
}

#EC2 outputs

output "instance_id" {
  value = module.aws_ec2_dev.instance_id
}


#ALB output

output "Application-LB-URL" {
  value = module.aws_alb_dev.Application-LB-URL
}

#ASG output

output "autoscaling_group_name" {
  value = module.aws_asg_dev.autoscaling_group_name
}

output "target_group_arns" {
  value = module.aws_alb_dev.target_group_arns
}


