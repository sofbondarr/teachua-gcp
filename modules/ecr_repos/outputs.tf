output "repository_urls" {
  description = "Map of repository names to their URLs"
  value = { for k, repo in aws_ecr_repository.this : k => repo.repository_url }
}
