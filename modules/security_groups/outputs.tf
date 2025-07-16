output "instance_sg_ids" {
  description = "Map Instance → Security Group ID"
  value       = { for k, sg in aws_security_group.instance_sg : k => sg.id }
}
