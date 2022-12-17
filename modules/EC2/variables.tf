variable "subnet_id" {
  type = list(any)
}

variable "ec2_name" {
  type    = string
  default = "web_ec2"
} 

variable "instance_type" {
  type    = string
  default = "t2.micro"
} 

variable "tags" {
  default = {
    Name   = "web"
    env = "dev"
  }
}
