variable "repo_names" {
  description = "List of ECR repository names to create"
  type        = list(string)
  default     = ["backend", "frontend"]
}

variable "tags" {
  description = "Tags to apply to each ECR repository"
  type        = map(string)
  default     = {}
}