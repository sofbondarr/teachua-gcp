variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "credentials_file" {
  description = "Путь к JSON-ключу сервисного аккаунта"
  type        = string
  default     = "~/.gcp/terraform-sa.json"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-west3"
}

variable "zone" {
  description = "GCP zone (для compute instances)"
  type        = string
  default     = "europe-west3-a"
}

variable "subnet_regions" {
  description = "Перечень регионов, где лежат public-подсети default-сети"
  type        = list(string)
  default     = ["europe-west3"]
}

variable "instances" {
  description = "Список VM для создания в формате (name, image, machine_type, subnetwork, ports)"
  type = list(object({
    name         = string
    image        = string
    machine_type = string
    subnetwork   = string
    ports        = list(number)
  }))
}
