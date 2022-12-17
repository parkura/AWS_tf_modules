
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

data "aws_security_group" "web-ssh-http-https" {
  name = "allow-ssh-http-https-sg"
}

resource "aws_instance" "web" {
  ami = data.aws_ami.amazon-linux-2.id
  subnet_id = var.subnet_id[0]
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.web-ssh-http-https.id]
  monitoring = false
  user_data = file("${path.module}/web.sh")
  tags = var.tags
} 


