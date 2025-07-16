terraform {
  backend "gcs" {
    # Создайте в GCP вручную бакет вида "terraform-state-<your-project>"
    bucket = "terraform-state-myapp"
    prefix = "terraform.tfstate"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}

# Достаем default-сеть и её подсеть(и)
data "google_compute_network" "default" {
  name = "default"
}

data "google_compute_subnetwork" "public" {
  for_each = toset(var.subnet_regions)
  name     = "default"
  region   = each.key
  network  = data.google_compute_network.default.id
}

module "web" {
  source  = "./modules/web"
  network = data.google_compute_network.default.id
  zone    = var.zone

  # список описаний VM
  instances = var.instances
}

# остальные модули: 
# module "db" { source = "./modules/db" … }           → google_sql_database_instance
# module "db_dumps_bucket" { source = "./modules/gcs_bucket_dump" … } → google_storage_bucket
# module "artifact_repos" { source = "./modules/artifact_repos" … } → google_artifact_registry_repository

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
