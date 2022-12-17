
output "autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = aws_autoscaling_group.dev-asg.name
}
  


