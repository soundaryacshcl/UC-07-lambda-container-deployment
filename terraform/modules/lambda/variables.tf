variable "name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "hello-lambda"  // Default value for the Lambda function name
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role for the Lambda function"
  type        = string
}

variable "image_uri" {
  description = "Image URI for the Lambda container"
  type        = string
}

variable "memory_size" {
  description = "Memory size for the Lambda function"
  type        = number
}

variable "timeout" {
  description = "Timeout for the Lambda function"
  type        = number
}

variable "environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
}