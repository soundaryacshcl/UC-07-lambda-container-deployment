terraform {
  backend "s3" {
    bucket  = "terraform-usecase-new07"
    key     = "envs/prod/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}