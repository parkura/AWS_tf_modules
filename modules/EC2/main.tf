data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_security_group" "allow-ssh-http-https-sg" {
  name = "allow-ssh-http-https-sg"
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.1"

  name                   = var.ec2_name
  ami                    = data.aws_ami.amazon-linux-2.id
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [data.aws_security_group.allow-ssh-http-https-sg.id]
  subnet_id              = var.subnet_id[0]

  tags = var.tags
}

