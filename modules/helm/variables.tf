variable "external_ip" {
  type = string
}
variable "release_name" {
  type = string
}
variable "chart_repository" {
  type = string
}
variable "chart_name" {
  type = string
}
variable "chart_version" {
  type = string
}
variable "namespace" {
  type = string
}

# Додаємо нові змінні під кластер
variable "cluster_endpoint" {
  description = "GKE cluster endpoint"
  type        = string
}

variable "cluster_ca_certificate" {
  description = "Base64-encoded CA certificate"
  type        = string
}

variable "cluster_token" {
  description = "Kubernetes auth token"
  type        = string
}
