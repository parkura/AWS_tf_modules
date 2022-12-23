output "autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = aws_autoscaling_group.dev-asg.name
}

output "launch_configuration_name" {
  description = "The Name of the Launch Configuration"
  value       = aws_launch_configuration.for_asg.name
}



