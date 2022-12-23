variable "subnet_id" {
  description = "Web instance subnet ID."
  type        = list(any)
}

variable "vpc_security_group_ids" {
  description = "Security group ID for the web instance."
  type        = string
}

variable "ec2_name" {
  description = "Web instance name."
  type        = string
  default     = "web_ec2"
}

variable "instance_type" {
  description = "Web instance type."
  type        = string
  default     = "t2.micro"
}

variable "monitoring" {
  description = "Monitoring."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Web instance tags."
  default = {
    Name = "web"
    env  = "dev"
  }
}
