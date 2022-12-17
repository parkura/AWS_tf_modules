
variable "lc_name" {
  type    = string
  default = "dev-asg-lc"
}

variable "asg_name" {
  type    = string
  default = "dev-asg"
}

variable "subnets" {
  type = list(any)
}


variable "lb_tg_arn" {
  type    = string
  default = ""
}

variable "lb_tg_name" {
  type    = string
  default = "dev-alb-tg"
}   

variable "tags" {
  default = {
    Owner   = "Soso Kumladze"
    Project = "VRTX-TRP"
  }
}


