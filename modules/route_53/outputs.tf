output "certificate_arn" {
  description = "The ARN of the ssl certificate"
  value       = aws_acm_certificate.aws-ssl-cert.arn
} 