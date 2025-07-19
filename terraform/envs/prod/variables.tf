variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "project_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "lambda-hello-world"  // Default value for the ECR repository name

}