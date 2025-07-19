resource "aws_lambda_function" "this" {
  function_name = "${var.project_name}-${var.environment}"
  package_type  = "Image"
  image_uri     = var.image_uri
  role          = var.lambda_role_arn

  memory_size = var.memory_size
  timeout     = var.timeout

  environment {
    variables = var.environment_variables
  }

  tags = {
    Environment = var.environment
    Name        = "${var.project_name}-${var.environment}"
  }
}
