resource "aws_security_group" "allow-ssh-http" {
  name   = var.sg_name
  vpc_id = module.vpc.vpc_id


  dynamic "ingress" {
    for_each = ["80", "22", "443", "3306"]
    content {
      description = "allow http, https, ssh, mysql"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}