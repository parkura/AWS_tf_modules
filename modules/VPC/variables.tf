variable "env" {
  default = "dev"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
  ]
}

variable "private_subnet_cidrs" {
  default = [
    "10.0.11.0/24",
    "10.0.22.0/24",
  ]
}

variable "tags" {
  default = {
    Owner   = "Soso Kumladze"
    Project = "VRTX-TRP"
  }
}


variable "web_sg_name" {
  type    = string
  default = "allow-ssh-http-https-sg"
} 

variable "load_balancer_sg_name" {
  type    = string
  default = "load_balancer-http-https"
} 

variable "rds_sg_name" {
  type    = string
  default = "allow-3306-mysql"
} 


