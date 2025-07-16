resource "aws_ecr_repository" "this" {
  for_each = toset(var.repo_names)

  name = each.value

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = var.tags
}