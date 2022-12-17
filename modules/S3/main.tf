
resource "aws_s3_bucket" "buckets" {
    count = length(var.s3_bucket_names)
    bucket = var.s3_bucket_names[count.index]  
    tags = {
    Owner        = "Soso Kumladze"
    Environment = "Dev"
  } 
}

resource "aws_s3_bucket_acl" "example" {
  count = length(var.s3_bucket_names)
  bucket = var.s3_bucket_names[count.index]
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  count = length(var.s3_bucket_names)
  bucket = var.s3_bucket_names[count.index]
  versioning_configuration {
    status = "Enabled"
  }
} 