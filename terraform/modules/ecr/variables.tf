variable "name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "region" {
  description = "AWS region for ECR"
  type        = string
  default     = "us-east-1"
}