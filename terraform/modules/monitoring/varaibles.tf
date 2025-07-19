variable "lambda_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
}