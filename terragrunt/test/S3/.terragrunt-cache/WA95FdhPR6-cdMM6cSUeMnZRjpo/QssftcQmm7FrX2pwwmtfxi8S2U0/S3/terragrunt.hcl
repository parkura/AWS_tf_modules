include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//S3"
}

inputs = {
  s3_bucket_names = [
    "test-bucket1.vrtx-trp-22-12-13",
    "test-bucket2.vrtx-trp-22-12-13",
    "test-bucket3.vrtx-trp-22-12-13"
  ]
  rule_name = "test-rule1"
}