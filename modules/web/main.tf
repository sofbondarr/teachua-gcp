resource "google_compute_firewall" "fw" {
  for_each  = { for inst in var.instances : inst.name => inst }
  name      = "${each.key}-fw"
  network   = var.network
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  dynamic "allow" {
    for_each = each.value.ports
    content {
      protocol = "tcp"
      ports    = [allow.value]
    }
  }
}

resource "google_compute_instance" "vm" {
  for_each     = { for inst in var.instances : inst.name => inst }
  name         = each.key
  machine_type = each.value.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = each.value.subnetwork
    access_config {}   # внешний IP
  }

  # опционально: добавить SSH-ключи через metadata["ssh-keys"]
}
