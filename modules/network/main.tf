resource "google_compute_address" "external_ip" {
  name    = "${var.cluster_name}-ip"
  project = var.project
  region  = var.region
}
