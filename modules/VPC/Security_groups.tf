resource "aws_security_group" "load_balancer_sg_name" {
  name   = var.load_balancer_sg_name
  description = "alb-web"
  vpc_id = aws_vpc.main.id


  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      description = "allow http, https"
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

   tags = var.tags
}

resource "aws_security_group" "web-ssh-http-https" {
  name   = var.web_sg_name
  description = "ec2-web"
  vpc_id = aws_vpc.main.id


  dynamic "ingress" {
    for_each = ["80", "22", "443"]
    content {
      description = "allow http, https, ssh"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      security_groups = [aws_security_group.load_balancer_sg_name.id]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

   tags = var.tags
}


resource "aws_security_group" "mysql_sg" {
  name        = var.rds_sg_name
  description = "Allow 3306 inbound traffic"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}