# RDS Database - GabrielM
resource "aws_db_instance" "pizzaflow_db" {
  identifier            = "pizzaflow-gabrielm-dev-database"
  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  engine                = "mysql"
  engine_version        = "8.0"
  username              = "pizzaflow_gabrielm"
  password              = "GabrielM_PizzaFlow_2024!"
  db_name               = "pizzaflow_gabrielm"
  parameter_group_name  = "default.mysql8.0"
  skip_final_snapshot   = true
  publicly_accessible   = false

  tags = {
    Name        = "Database - gabrielm"
    StudentName = "gabrielm"
    StudentID   = "004"
    Project     = "pizzaflow-gabrielm"
    Environment = "dev"
    Owner       = "Gabriel Marcos"
  }
}