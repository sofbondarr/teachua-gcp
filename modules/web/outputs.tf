output "instance_public_ips" {
  description = "Map VM name → его внешний IP"
  value       = { for k, i in google_compute_instance.vm : k => i.network_interface[0].access_config[0].nat_ip }
}

output "firewall_ids" {
  description = "Map VM name → ID его правила Firewall"
  value       = { for k, f in google_compute_firewall.fw : k => f.id }
}
