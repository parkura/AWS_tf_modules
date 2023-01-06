
output "application_lb_url" {
  description = "URL of the load balancer."
  value       = aws_lb.application-lb.dns_name
}

output "application_lb_zone_id" {
  description = "Zone ID of the load balancer."
  value       = aws_lb.application-lb.zone_id
}

output "lb_target_group_arn" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group"
  value       = aws_lb_target_group.dev-lb-tg.arn
}

output "lb_id" {
  description = "The ID and ARN of the load balancer."
  value       = aws_lb.application-lb.id
}