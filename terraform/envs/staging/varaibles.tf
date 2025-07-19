variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "staging"
}
variable "image_uri" {
  description = "Docker image URI for Lambda"
  type        = string
}