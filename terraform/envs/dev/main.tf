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

module "vpc" {
  source      = "../../../modules/vpc"
  environment = var.environment
}

module "iam" {
  source      = "../../../modules/iam"
  environment = var.environment
}

module "ecr" {
  source       = "../../../modules/ecr"
  project_name = var.project_name
}

module "monitoring" {
  source      = "../../../modules/monitoring"
  environment = var.environment
}

