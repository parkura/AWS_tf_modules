output "s3_bucket_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.buckets[*].bucket_domain_name
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = aws_s3_bucket.buckets[*].region
}

output "s3_bucket_id" {
  description = "The names of the buckets."
  value       = aws_s3_bucket.buckets[*].id
}

output "log_target_prefix" {
  description = "S3 bucket log path."
  value       = aws_s3_bucket_logging.log.target_prefix
}

output "aws_mykey_arn" {
  description = "S3 bucket kms_key arn."
  value       = aws_kms_key.mykey.arn
}

output "log_s3_bucket" {
  description = "Log S3 bucket name."
  value       = aws_s3_bucket_logging.log.bucket
}

output "s3_buckets" {
  description = "Log S3 bucket name."
  value       = aws_s3_bucket.buckets
}

