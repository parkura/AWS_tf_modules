#ACM CONFIGURATION
resource "aws_acm_certificate" "aws-ssl-cert" {
  domain_name       = var.dns-name
  validation_method = "DNS"
  tags = {
    Name = "Webservers-ACM"
  }
}

#Validates ACM issued certificate via Route53
resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.aws-ssl-cert.arn
  for_each                = aws_route53_record.cert_validation
  validation_record_fqdns = [aws_route53_record.cert_validation[each.key].fqdn]
}