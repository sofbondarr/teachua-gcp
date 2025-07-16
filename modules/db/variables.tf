variable "db_name" {
  description = "The name of the initial PostgreSQL database to create"
  type        = string
}

variable "db_username" {
  description = "Master username for the RDS PostgreSQL"
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS PostgreSQL"
  type        = string
  sensitive   = true
}

variable "security_group_ids" {
  description = "List of security group IDs for RDS"
  type        = list(string)
}

variable "subnet_group_name" {
  description = "Name DB Subnet Group"
  type        = string
}

variable "db_subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
}