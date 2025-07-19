variable "name" {
  description = "Name prefix for the API Gateway HTTP API"
  type        = string
}

variable "lambda_arn" {
  description = "ARN of the Lambda function to integrate with API Gateway"
  type        = string
}