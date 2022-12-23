
//AMI id of Amazon Linux
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

//Create instance
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon-linux-2.id
  subnet_id              = var.subnet_id[0]
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_ids]
  monitoring             = var.monitoring
  user_data              = file("${path.module}/web.sh")
  tags                   = var.tags
}


