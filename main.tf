terraform {
  required_providers {
    google  = { source = "hashicorp/google", version = "~> 4.0" }
    helm    = { source = "hashicorp/helm",  version = "~> 2.0" }
  }
}

locals {
  cfg = jsondecode(file(var.config_file))
}

provider "google" {
  project = local.cfg.project
  region  = local.cfg.region
}

data "google_client_config" "default" {}

module "network" {
  source       = "./modules/network"
  project      = local.cfg.project
  region       = local.cfg.region
  cluster_name = local.cfg.cluster_name
}

module "cluster" {
  source             = "./modules/cluster"
  project            = local.cfg.project
  region             = local.cfg.region
  cluster_name       = local.cfg.cluster_name
  initial_node_count = local.cfg.initial_node_count
  machine_type       = local.cfg.machine_type
}

module "helm" {
  source           = "./modules/helm"
  external_ip      = module.ip.ip_address
  release_name     = local.cfg.release_name
  chart_repository = local.cfg.chart_repository
  chart_name       = local.cfg.chart_name
  chart_version    = local.cfg.chart_version
  namespace        = local.cfg.namespace

  cluster_endpoint       = module.cluster.endpoint
  cluster_ca_certificate = module.cluster.master_auth.cluster_ca_certificate
  cluster_token          = data.google_client_config.default.access_token
}