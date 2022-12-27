//Create S3 Buckets
resource "aws_s3_bucket" "buckets" {
  count         = length(var.s3_bucket_names)
  bucket        = var.s3_bucket_names[count.index]
  force_destroy = true
  tags          = var.tags
}

//Predefined set of grant "private"
resource "aws_s3_bucket_acl" "example" {
  count  = length(var.s3_bucket_names)
  bucket = var.s3_bucket_names[count.index]
  acl    = var.acl
}

//Enable bucket versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
  count  = length(var.s3_bucket_names)
  bucket = var.s3_bucket_names[count.index]
  versioning_configuration {
    status = "Enabled"
  }
}

//Enable Logging
resource "aws_s3_bucket_logging" "log" {
  bucket        = aws_s3_bucket.buckets[1].id
  target_bucket = aws_s3_bucket.buckets[0].id
  target_prefix = var.target_prefix
}

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.buckets[2].id

  rule {
    id = var.rule_name

    filter {
      prefix = var.target_prefix
    }

    noncurrent_version_expiration {
      noncurrent_days = var.expiration
    }

    noncurrent_version_transition {
      noncurrent_days = var.transition_to_standard_ia
      storage_class   = var.storage_class_from
    }

    noncurrent_version_transition {
      noncurrent_days = var.transition_to_glacier
      storage_class   = var.storage_class_to
    }
    status = "Enabled"
  }
}

//server_side_encryption_configuration
resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = var.key_deletion
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  count  = length(var.s3_bucket_names)
  bucket = var.s3_bucket_names[count.index]
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}