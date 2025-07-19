variable "project_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "lambda-hello-world"  // Default value for the ECR repository name
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "region" {
  description = "AWS region for ECR"
  type        = string
  default     = "ap-south-1"
}
