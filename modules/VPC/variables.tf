variable "env" {
  description = "The name of the environment."
  default     = "dev"
}

variable "vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "public_subnet_ipv4_cidrs."
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
  ]
}

variable "private_subnet_cidrs" {
  description = "Private_subnet_ipv4_cidrs."
  default = [
    "10.0.11.0/24",
    "10.0.22.0/24",
  ]
}

variable "tags" {
  description = "Tags for the VPC."
  default = {
    Owner   = "Soso Kumladze"
    Project = "VRTX-TRP"
  }
}

variable "web_sg_name" {
  description = "Name of the security group for ec2."
  type        = string
  default     = "allow-ssh-http-https-sg"
}

variable "load_balancer_sg_name" {
  description = "Name of the security group for ALB & ASG."
  type        = string
  default     = "load_balancer-http-https"
}

variable "rds_sg_name" {
  description = "Name of the security group for mysql RDS instance."
  type        = string
  default     = "allow-3306-mysql"
}


