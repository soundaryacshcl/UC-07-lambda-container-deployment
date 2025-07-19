resource "aws_lambda_function" "this" {
  function_name = var.name
  role          = var.lambda_role_arn
  package_type  = "Image"
  image_uri     = var.image_uri   // Expecting a dynamic value (e.g. module.ecr.repository_url with :latest appended)
  memory_size   = var.memory_size
  timeout       = var.timeout

  tracing_config {
    mode = "Active"
  }

  environment {
    variables = var.environment_variables
  }

  tags = {
    Environment = var.environment
  }
}