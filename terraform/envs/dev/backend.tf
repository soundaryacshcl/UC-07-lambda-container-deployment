terraform {
  backend "s3" {
    bucket  = "terraform-usecase-new07"
    key     = "envs/dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}