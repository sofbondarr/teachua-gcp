# terraform {
#   required_providers {
#     local = {
#       source  = "hashicorp/local"
#       version = "2.4.0"
#     }
#   }
# }

locals {
  # Получаем map имя→IP из модуля web
  instance_public_ips = module.web.instance_public_ips

  # Берём первое имя из списка instances (можете изменить индекс или логику под вашу 
  # логику выбора нужного инстанса)
  first_instance_name = var.instances[0].name

  # Достаём IP этого инстанса
  instance_ip = lookup(local.instance_public_ips, local.first_instance_name)

  # Endpoint RDS из модуля db
  rds_endpoint = module.db.rds_endpoint
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/ansible/hosts.yml"
  content  = templatefile(
    "${path.module}/ansible/hosts.yml.tpl",
    {
      instance_ip   = local.instance_ip,
      rds_endpoint  = local.rds_endpoint
    }
  )
}
