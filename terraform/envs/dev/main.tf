module "lambda" {
  source       = "../../modules/lambda"
  environment  = var.environment
  project_name = var.project_name
  name         = var.project_name                  # ✅ Add this line
  image_uri    = var.image_uri
  lambda_role_arn = module.iam.lambda_exec_role_arn
  memory_size     = 512
  timeout         = 10
  environment_variables = {
    LOG_LEVEL = "info"
  }
}





module "api_gateway" {
  source               = "../../modules/api_gateway"
  name                 = "hello-api"
  lambda_function_name = module.lambda.lambda_function_name
  environment          = var.environment
}

module "ecr" {
  source      = "../../modules/ecr"
  project_name = var.project_name
  environment = var.environment
  region      = var.aws_region
  skip_creation = true  # <–– add this if repo already exists

}

module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
}
module "monitoring" {
  source      = "../../modules/monitoring"
  lambda_name = module.lambda.lambda_function_name  // using lambda module output
  environment = var.environment
}

module "vpc" {
  source             = "../../modules/vpc"

  # Set to true only for the first env (e.g., dev); false for staging/prod
  create_vpc         = true

  vpc_cidr           = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["ap-south-1a", "ap-south-1b"]
  environment        = var.environment
}

