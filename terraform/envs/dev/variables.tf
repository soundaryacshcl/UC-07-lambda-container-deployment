variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "image_uri" {
  description = "Docker image URI for Lambda"
  type        = string
}
