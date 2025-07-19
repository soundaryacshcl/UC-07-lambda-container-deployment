resource "aws_ecr_repository" "this" {
  count                = var.skip_creation ? 0 : 1
  name                 = var.project_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [image_scanning_configuration]
  }

  tags = {
    Environment = var.environment
    Name        = var.project_name
  }
}
