include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//S3"
}

inputs = {
  s3_bucket_names = [
    "prod-bucket1.vrtx-trp-22-12-13",
    "prod-bucket2.vrtx-trp-22-12-13",
    "prod-bucket3.vrtx-trp-22-12-13"
  ]
  rule_name = "prod-rule1"
}