resource "aws_s3_bucket" "rugged_buckets" {
  count         = length(var.s3_bucket_names) //count will be 3
  bucket        = var.s3_bucket_names[count.index]
  acl           = "private"
  force_destroy = true
  versioning {
    enabled = true
  }
}