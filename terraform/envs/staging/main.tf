module "lambda" {
  source                = "../../modules/lambda"
  name                  = "hello-lambda"
  image_uri             = var.image_uri
  lambda_role_arn       = module.iam.lambda_role_arn
  memory_size           = 128
  timeout               = 10
  environment_variables = {}
  environment           = var.environment
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
  vpc_cidr           = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["ap-south-1a", "ap-south-1b"]
  environment        = var.environment
}
