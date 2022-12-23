#VPC outputs	
output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.aws_vpc_dev.vpc_id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC."
  value       = module.aws_vpc_dev.vpc_cidr
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets."
  value       = module.aws_vpc_dev.private_subnet_ids
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets."
  value       = module.aws_vpc_dev.private_subnet_ids
}

output "aviability_zones" {
  description = "A list of availability zones to this module."
  value       = module.aws_vpc_dev.availability_zones
}

output "common_tags" {
  description = "Common tags for this all modules."
  value       = module.aws_vpc_dev.common_tags
}

output "ec2_sg_id" {
  description = "ID of the security group for ec2."
  value       = module.aws_vpc_dev.ec2_sg_id
}

output "alb_sg_id" {
  description = "ID of the security group for ALB & ASG."
  value       = module.aws_vpc_dev.alb_sg_id
}

output "db_sg_id" {
  description = "ID of the security group for mysql RDS instance."
  value       = module.aws_vpc_dev.db_sg_id
}

#EC2 outputs
output "instance_id" {
  description = "ID of the web ec2 instance."
  value = module.aws_ec2_dev.instance_id
}

output "instance_ami" {
  description = "AMI of the web ec2 instance."
  value = module.aws_ec2_dev.instance_ami
} 

#ALB output
output "Application_LB_URL" {
  description = "URL of the load balancer."
  value = module.aws_alb_dev.Application_LB_URL
}

output "Application_LB_zone_id" {
  description = "Zone ID of the load balancer."
  value = module.aws_alb_dev.Application_LB_zone_id
}

output "lb_target_group_arn" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group"
  value = module.aws_alb_dev.lb_target_group_arn
}

output "lb_id" {
  description = "The ID and ARN of the load balancer."
  value = module.aws_alb_dev.lb_id
} 

#Route_53 output
output "certificate_arn" {
  description = "The ARN of the aws-ssl certificate"
  value = module.aws_route_53_dev.certificate_arn.arn
} 

#ASG output
output "autoscaling_group_name" {
  description = "The Name of the Auto Scaling Group."
  value = module.aws_asg_dev.autoscaling_group_name
}

output "launch_configuration_name" {
  description = "The Name of the Launch Configuration"
  value       = module.aws_asg_dev.launch_configuration_name
}
   
#RDS output
output "rds_username" {
  description = "DB instance username." //admin
  value       = module.aws_rds_dev.rds_username
}

output "rds_address" {
  description = "DB instance address."
  value       = module.aws_rds_dev.rds_address
}

output "rds_port" {
  description = "DB instance port number."
  value       = module.aws_rds_dev.rds_port
}

output "rds_password" {
  description = "DB instance password."
  value       = module.aws_rds_dev.rds_password
  sensitive   = true
}

#S3 bucket output
output "s3_bucket_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value = module.aws_s3_bucket.s3_bucket_bucket_domain_name
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value = module.aws_s3_bucket.s3_bucket_region
}

output "s3_bucket_id" {
  description = "The names of the buckets."
  value = module.aws_s3_bucket.s3_bucket_id
}

output "log_target_prefix" {
  description = "S3 bucket log path."
  value = module.aws_s3_bucket.log_target_prefix
}

output "aws_mykey_arn" {
  description = "S3 bucket kms_key arn."
  value = module.aws_s3_bucket.aws_mykey_arn
}

output "log_S3_bucket" {
  description = "Log S3 bucket name."
  value = module.aws_s3_bucket.log_S3_bucket
} 
