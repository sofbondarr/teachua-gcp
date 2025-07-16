output "instance_ips" {
  description = "Map VM name → его внешний IP"
  value       = module.web.instance_public_ips
}

# Пример для Cloud SQL:
# output "db_public_ip" {
#   description = "Cloud SQL public IP"
#   value       = module.db.db_public_ip
# }
#
# output "db_port" {
#   description = "Cloud SQL port"
#   value       = module.db.db_port
# }

# Аналогично для бакета дампов и репозиториев
