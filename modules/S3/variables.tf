variable "s3_bucket_names" {
  description = "Names of the S3 Buckets."
  type        = list(string)
  default = [
    "bucket1.vrtx-trp-22-12-13",
    "bucket2.vrtx-trp-22-12-13",
    "bucket3.vrtx-trp-22-12-13"
  ]
}

variable "tags" {
  description = "Tags for the VPC."
  default = {
    Owner   = "Soso Kumladze"
    Project = "VRTX-TRP"
  }
}

variable "target_prefix" {
  description = "S3 bucket log path."
  type        = string
  default     = "log/"
}

variable "acl" {
  description = "ACL to apply to the bucket.."
  type        = string
  default     = "private"
}

variable "rule_name" {
  description = "S3 bucket lifecycle rule name."
  type        = string
  default     = "config"
}

variable "storage_class_from" {
  description = "Storage class name where we want to move object from."
  type        = string
  default     = "STANDARD_IA"
}

variable "storage_class_to" {
  description = "Storage class name where we want to move object to."
  type        = string
  default     = "GLACIER"
}

variable "expiration" {
  description = "Noncurrent version expiration days for the lifecycle rule."
  type        = number
  default     = 90
}

variable "transition_to_STANDARD_IA" {
  description = "Noncurrent version transition days for the class STANDARD_IA."
  type        = number
  default     = 30
}

variable "transition_to_GLACIER" {
  description = "Noncurrent version transition days for the class GLACIER."
  type        = number
  default     = 60
}

variable "key_deletion" {
  description = "Number of days of kms-key deletion."
  type        = number
  default     = 10
}

