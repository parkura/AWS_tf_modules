output "instance_id" {
  description = "Web instance ID."
  value       = aws_instance.web.id
}

output "instance_ami" {
  description = "Web instance subnet AMI."
  value       = aws_instance.web.ami
}