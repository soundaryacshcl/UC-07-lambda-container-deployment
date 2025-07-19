output "repository_uri" {
  description = "The URI of the created ECR repository"
  value       = aws_ecr_repository.this.repository_uri
}
