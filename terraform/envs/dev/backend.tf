terraform {
  backend "s3" {
    bucket  = "terraform-usecase-07"
    key     = "envs/dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}