# Створюємо по одній SG на кожен інстанс
resource "aws_security_group" "instance_sg" {
  for_each = { for inst in var.instances : inst.name => inst }

  name        = "${each.key}"
  description = "SG for instance ${each.key}"
  vpc_id      = var.vpc_id

  # Динамічно робимо ingress-правила під кожен порт
  dynamic "ingress" {
    for_each = each.value.ports
    content {
      description = "Allow TCP port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.allowed_cidrs
    }
  }

  # Дозволяємо весь вихідний трафік
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = each.key
  }
}
