#find default VPC
data "aws_vpc" "default" {
  default = true
}

#collecting subnets VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

#group of subnets RDS
resource "aws_db_subnet_group" "default" {
  name       = var.subnet_group_name
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = var.subnet_group_name
  }
}

#create RDS PostgreSQL instance
resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "17.4"
  instance_class       = "db.t4g.micro"

  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password

  skip_final_snapshot  = true
  publicly_accessible  = true
  iam_database_authentication_enabled = true //enable iam auth without passwd, token only

  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.default.name
  multi_az               = false

  tags = {
    Name = "rds-postgres-free-tier"
  }
}