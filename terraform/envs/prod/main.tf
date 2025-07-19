module "ecr" {
  source      = "../../modules/ecr"
  project_name = var.project_name
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
  lambda_name = module.lambda.lambda_function_name
  environment = var.environment
}