output "external_ip" {
  value = module.network.ip_address
}

output "cluster_endpoint" {
  value = module.cluster.endpoint
}

output "helm_release_status" {
  value = module.helm.status
}
