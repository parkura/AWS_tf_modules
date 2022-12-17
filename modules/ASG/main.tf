
data "aws_security_group" "alb_sg" {
  name = "load_balancer-http-https"
}

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


resource "aws_launch_configuration" "for_asg" {
  name_prefix     = var.lc_name
  image_id        = data.aws_ami.web-ec2.id
  instance_type   = "t2.micro"
  security_groups = [data.aws_security_group.alb_sg.id]

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "dev-asg" {
  name                 = var.asg_name
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1
  force_delete         = true
  launch_configuration = aws_launch_configuration.for_asg.name
  vpc_zone_identifier  = var.subnets[*]
  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
  
}   

data "aws_lb_target_group" "dev-lb-tg" {
  arn  = var.lb_tg_arn
  name = var.lb_tg_name
}

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.dev-asg.name
  lb_target_group_arn    = data.aws_lb_target_group.dev-lb-tg.arn
}  




