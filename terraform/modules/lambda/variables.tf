variable "name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_role_arn" {
  description = "IAM Role ARN for the Lambda"
  type        = string
}

variable "image_uri" {
  description = "ECR Image URI"
  type        = string
}

variable "memory_size" {
  description = "Lambda memory size"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Lambda execution timeout in seconds"
  type        = number
  default     = 10
}

variable "environment_variables" {
  description = "Environment variables for Lambda"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}
variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  
}