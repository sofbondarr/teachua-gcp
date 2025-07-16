variable "network" {
  description = "self_link или имя сети (google_compute_network.default.id)"
  type        = string
}

variable "zone" {
  description = "GCP зона для VM"
  type        = string
}

variable "instances" {
  description = "Список VM (name, image, machine_type, subnetwork, ports)"
  type = list(object({
    name         = string
    image        = string
    machine_type = string
    subnetwork   = string
    ports        = list(number)
  }))
}
