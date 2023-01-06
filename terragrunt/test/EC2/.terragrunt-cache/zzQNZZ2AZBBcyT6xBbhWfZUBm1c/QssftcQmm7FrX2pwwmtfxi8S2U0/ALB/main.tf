//Create Application Load Balancer
resource "aws_lb" "application-lb" {
  name                       = var.alb_name
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.security_groups]
  subnets                    = var.subnets[*]
  enable_deletion_protection = true
  tags                       = var.tags
}

#Target group, listeners and attachment for web-ec2
resource "aws_lb_target_group" "dev-lb-tg" {
  name        = var.alb_tg_name
  target_type = var.lb_settings["target_type"] //instance
  port        = var.lb_settings["port"]        //80
  protocol    = var.lb_settings["protocol"]    //HTTP
  vpc_id      = var.vpc_id
  health_check {
    healthy_threshold   = var.health_check["healthy_threshold"]
    interval            = var.health_check["interval"]
    unhealthy_threshold = var.health_check["unhealthy_threshold"]
    timeout             = var.health_check["timeout"]
    path                = var.health_check["path"]
    port                = var.health_check["port"]
  }
  tags = var.tags
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.dev-lb-tg.arn
  target_id        = var.instance_id
  port             = var.lb_settings["port"] //80
}

/* resource "aws_lb_listener" "lb-https-listener" {
  load_balancer_arn = aws_lb.application-lb.arn
  ssl_policy        = var.listener_settings["ssl_policy"] //"ELBSecurityPolicy-2016-08"
  port              = var.listener_settings["port"]       //"443"
  protocol          = var.listener_settings["protocol"]   //"HTTPS"
  certificate_arn   = var.certificate_arn
  default_action {
    type             = var.listener_settings["type"] //"forward"
    target_group_arn = aws_lb_target_group.dev-lb-tg.arn
  }
} */

/* resource "aws_lb_listener" "lb-http-listener" {
  load_balancer_arn = aws_lb.application-lb.arn
  port              = var.lb_settings["port"]     //"80"
  protocol          = var.lb_settings["protocol"] //"HTTP"
  default_action {
    type = var.http_listener_default_action //"redirect"
    redirect {
      port        = var.listener_settings["port"]        //"443"
      protocol    = var.listener_settings["protocol"]    //"HTTPS"
      status_code = var.listener_settings["status_code"] //"HTTP_301"
    }
  }
} */


resource "aws_lb_listener" "lb-http-listener" {
  load_balancer_arn = aws_lb.application-lb.arn
  port              = var.lb_settings["port"]     //"80"
  protocol          = var.lb_settings["protocol"] //"HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.dev-lb-tg.arn
  }
}