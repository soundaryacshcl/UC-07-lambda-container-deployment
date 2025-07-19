terraform {
  backend "s3" {
    bucket  = "terraform-hcl-usecases"
    key     = "UC-07/envs/prod/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
