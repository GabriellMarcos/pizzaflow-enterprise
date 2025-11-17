# CloudWatch Log Group - GabrielM
resource "aws_cloudwatch_log_group" "pizzaflow" {
  name              = "/ecs/pizzaflow-gabrielm-dev"
  retention_in_days = 30

  tags = {
    Name        = "CloudWatch Logs - gabrielm"
    StudentName = "gabrielm"
    StudentID   = "004"
    Project     = "pizzaflow-gabrielm"
    Environment = "dev"
    Owner       = "Gabriel Marcos"
    Purpose     = "Application logs and monitoring"
  }
}