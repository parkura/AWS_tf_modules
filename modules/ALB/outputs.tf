
output "Application-LB-URL" {
  value = aws_lb.application-lb.dns_name
}

output "target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group"
  value       = aws_lb_target_group.dev-lb-tg.arn
}


output "lb_id" {
  description = "The ID and ARN of the load balancer we created"
  value       = aws_lb.application-lb.id
}