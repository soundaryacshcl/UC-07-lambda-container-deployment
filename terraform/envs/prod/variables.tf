variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "image_uri" {
  description = "Docker image URI for Lambda"
  type        = string
}