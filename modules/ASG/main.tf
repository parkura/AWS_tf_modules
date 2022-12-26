//AMI id of Amazon Linux
data "aws_ami" "web-ec2" {
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

//Create launch_configuration for Auto Scaling Group
resource "aws_launch_configuration" "for_asg" {
  name_prefix     = var.lc_name
  image_id        = data.aws_ami.web-ec2.id
  instance_type   = var.instance_type
  security_groups = [var.security_groups]
  lifecycle {
    create_before_destroy = true
  }
}

// Create Auto Scaling Group
resource "aws_autoscaling_group" "dev-asg" {
  name                 = var.asg_name
  min_size             = var.size["min_size"]
  max_size             = var.size["max_size"]
  desired_capacity     = var.size["desired_capacity"]
  force_delete         = true
  launch_configuration = aws_launch_configuration.for_asg.name
  vpc_zone_identifier  = var.subnets[*]
}

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.dev-asg.name
  lb_target_group_arn    = var.lb_target_group_arn
}