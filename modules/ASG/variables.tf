variable "lc_name" {
  description = "The Name of the Lanch Configuration."
  type        = string
  default     = "dev-asg-lc"
}

variable "asg_name" {
  description = "The Name of the Auto Scaling Group."
  type        = string
  default     = "dev-asg"
}

variable "subnets" {
  description = "Private subnets Auto Scaling Group."
  type        = list(any)
}

variable "size" {
  description = "Auto Scaling Group size."
  type        = map(string)
  default = {
    "min_size"         = "1"
    "max_size"         = "3"
    "desired_capacity" = "1"
  }
}

variable "instance_type" {
  description = "The type of instance for Lanch Configuration"
  type        = string
  default     = "t2.micro"
}

variable "lb_target_group_arn" {
  description = "The ARN of the Load Balancer Target Group."
  type        = string
}

variable "security_groups" {
  description = "Security_groups for the Auto Scaling Group."
  type        = string
}

variable "tags" {
  description = "Common tags."
  default = {
    Owner   = "Soso Kumladze"
    Project = "VRTX-TRP"
  }
}


