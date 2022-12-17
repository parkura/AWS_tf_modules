
variable "health_check" {
  type = map(string)
  default = {
    "timeout"             = "10"
    "interval"            = "20"
    "path"                = "/"
    "port"                = "80"
    "unhealthy_threshold" = "2"
    "healthy_threshold"   = "3"
  }
}


variable "tags" {
  default = {
    Owner   = "Soso Kumladze"
    Project = "VRTX-TRP"
  }
}

variable "vpc_id" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "alb_name" {
  default = "dev-alb"
}

variable "alb_tg_name" {
  default = "dev-alb-tg"
}

variable "subnets" {
  type = list(any)
} 

#

variable "dns-name" {
  type    = string
  default = "cmcloudlab1816.info"
}

variable "site-name" {
  type    = string
  default = ""
}