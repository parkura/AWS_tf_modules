output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC."
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets."
  value       = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets."
  value       = aws_subnet.private_subnets[*].id
}

output "availability_zones" {
  description = "A list of availability zones to this module."
  value       = data.aws_availability_zones.available.all_availability_zones
}

output "common_tags" {
  description = "Common tags for this module."
  value       = var.tags
}

output "ec2_sg_id" {
  description = "ID  of the ec2 security group."
  value       = aws_security_group.web-ssh-http-https.id
}

output "alb_sg_id" {
  description = "ID  of the ALB security group."
  value       = aws_security_group.load_balancer_sg_name.id
}

output "db_sg_id" {
  description = "ID  of the mysql security group."
  value       = aws_security_group.mysql_sg.id
}
