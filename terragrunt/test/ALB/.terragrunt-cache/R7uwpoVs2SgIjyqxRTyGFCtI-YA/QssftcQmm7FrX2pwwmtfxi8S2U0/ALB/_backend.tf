# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket  = "terragrunt-remote-state-bucket-1233"
    encrypt = true
    key     = "test/ALB/terraform.tfstate"
    region  = "us-east-1"
  }
}
