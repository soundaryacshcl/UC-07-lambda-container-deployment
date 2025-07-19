module "ecr" {
  source      = "../../modules/ecr"
  name        = "lambda-hello-world"
  environment = var.environment
  region      = "us-east-1"
}

module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
}

module "lambda" {
  source                = "../../modules/lambda"
  name                  = "hello-lambda"
  image_uri             = "${module.ecr.repository_url}:latest"
  lambda_role_arn       = module.iam.lambda_role_arn
  environment           = var.environment
  memory_size           = 128
  timeout               = 10
  environment_variables = {}
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
  availability_zones = ["us-east-1a", "us-east-1b"]
  environment        = var.environment
}