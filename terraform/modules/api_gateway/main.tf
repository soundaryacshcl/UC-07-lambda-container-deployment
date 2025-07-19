resource "aws_apigatewayv2_api" "this" {
  name          = var.name
  protocol_type = "HTTP"
  target        = aws_lambda_function_url.this.function_url

  tags = {
    Environment = var.environment
  }
}

resource "aws_lambda_function_url" "this" {
  function_name      = var.lambda_function_name
  authorization_type = "NONE"
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunctionUrl"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
}


