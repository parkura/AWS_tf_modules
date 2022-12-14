	
output "vpc_name" {
  value = module.vpc.name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = var.vpc_cidr
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "aviability_zones" {
  value = module.vpc.azs
} 

output "security_group_ids" {
  value = aws_security_group.allow-ssh-http.id
} 



