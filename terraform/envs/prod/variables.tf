variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "image_uri" {
  description = "Docker image URI for Lambda"
  type        = string
}
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}
