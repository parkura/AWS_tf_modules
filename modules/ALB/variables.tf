variable "health_check" {
  description = "Load balancer healt checks."
  type        = map(string)
  default = {
    "timeout"             = "10"
    "interval"            = "20"
    "path"                = "/"
    "port"                = "80"
    "unhealthy_threshold" = "2"
    "healthy_threshold"   = "3"
  }
}

variable "lb_settings" {
  description = "Load balancer settings."
  type        = map(string)
  default = {
    "target_type" = "instance"
    "port"        = 80
    "protocol"    = "HTTP"
  }
}

variable "listener_settings" {
  description = "aws_lb_listener HTTP & HTTPS settings."
  type        = map(string)
  default = {
    "ssl_policy"  = "ELBSecurityPolicy-2016-08"
    "port"        = "443"
    "protocol"    = "HTTPS"
    "type"        = "forward"
    "status_code" = "HTTP_301"
  }
}

variable "http_listener_default_action" {
  description = "HTTP listener default action type."
  type        = string
  default     = "redirect"
}

variable "tags" {
  description = "tags of the load balancer & Target Geoup."
  type        = map
  default = {
    Owner   = "Soso Kumladze"
    Project = "VRTX-TRP"
  }
}

variable "vpc_id" {
  description = "VPC ID for the load balancer."
  type        = string
}

variable "instance_id" {
  description = "Instance ID for the target group attachment - test."
  type        = string
}

variable "security_groups" {
  description = "SG ID for the load balancer."
  type        = string
}

variable "alb_name" {
  description = "Name of the load balancer."
  type        = string
  default     = "dev-alb"
}

variable "alb_tg_name" {
  description = "Name of the load balancer target group."
  type        = string
  default     = "dev-alb-tg"
}

variable "subnets" {
  description = "Public Subnets for the load balancer."
  type        = list(any)
}

variable "certificate_arn" {
  description = "The ARN of the aws-ssl certificate"
  type        = string
}