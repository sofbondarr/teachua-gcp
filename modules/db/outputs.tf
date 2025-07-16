output "rds_endpoint" {
  description = "Endpoint RDS"
  value       = aws_db_instance.postgres.address
}

output "rds_port" {
  description = "Port RDS"
  value       = aws_db_instance.postgres.port
}