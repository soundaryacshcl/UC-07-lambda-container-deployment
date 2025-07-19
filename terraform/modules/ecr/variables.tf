variable "project_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "skip_creation" {
  description = "Whether to skip ECR repo creation (set to true if already exists)"
  type        = bool
  default     = false
}
