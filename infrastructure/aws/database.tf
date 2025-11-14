# Terraform para RDS PostgreSQL
resource "aws_db_instance" "pizzaflow_database" {
  identifier              = "pizzaflow-db-${var.environment}"
  instance_class          = var.db_instance_class
  allocated_storage       = 20
  max_allocated_storage   = 100
  engine                  = "postgres"
  engine_version          = "14.7"
  username                = var.db_username
  password                = var.db_password
  db_name                 = "pizzaflow"
  port                    = 5432

  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.pizzaflow.name

  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "sun:04:00-sun:05:00"

  skip_final_snapshot     = var.environment == "production" ? false : true
  final_snapshot_identifier = "pizzaflow-db-final-${var.environment}"

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  performance_insights_enabled = true
  monitoring_interval        = 60

  tags = {
    Name        = "PizzaFlow Database"
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "pizzaflow" {
  name       = "pizzaflow-db-subnet-group-${var.environment}"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "PizzaFlow DB Subnet Group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "pizzaflow-rds-sg-${var.environment}"
  description = "Security group for PizzaFlow RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pizzaflow-rds-sg"
  }
}