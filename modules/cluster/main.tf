resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  project            = var.project
  location           = var.region
  initial_node_count = var.initial_node_count

  node_config {
    machine_type = var.machine_type
  }
}
