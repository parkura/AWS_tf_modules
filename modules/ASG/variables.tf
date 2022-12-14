
variable "asg_name" {
  type = string
  default = "dev-asg"
}

variable "lt_name" {
  type = string
  default = "dev-asg"
}

variable "lt_description" {
  type = string
  default = "Launch template example"
}

variable "zone" {
  type = string
  default = "us-west-1b"
}

variable "subnets" {
  type = list
}


variable "lb_tg_arn" {
  type    = string
  default = ""
}

variable "lb_tg_name" {
  type    = string
  default = "dev-alb-tg"
}

