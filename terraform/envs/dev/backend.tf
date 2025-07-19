terraform {
  backend "s3" {
    bucket  = "terraform-hcl-usecases"
    key     = "UC-07/envs/dev/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
