output "endpoint" {
  value = google_container_cluster.primary.endpoint
}
output "master_auth" {
  value = google_container_cluster.primary.master_auth[0]
}
