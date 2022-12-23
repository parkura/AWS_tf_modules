variable "dns-name" {
  description = "The Domain name we use for web server"
  type        = string
  default     = "example.com"
}

variable "name" {
  description = "The Domain name we use for aws route53 record"
  type        = string
}

variable "zone_id" {
  description = "Zone ID of the load balancer."
  type        = string
}