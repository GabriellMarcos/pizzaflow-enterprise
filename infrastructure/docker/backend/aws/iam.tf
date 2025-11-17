# IAM Role para ECS - GabrielM
resource "aws_iam_role" "ecs_execution" {
  name = "pizzaflow-gabrielm-dev-ecs-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name        = "ECS Execution Role - gabrielm"
    StudentName = "gabrielm"
    StudentID   = "004"
    Project     = "pizzaflow-gabrielm"
    Environment = "dev"
    Owner       = "Gabriel Marcos"
    Purpose     = "ECS task execution permissions"
  }
}

resource "aws_iam_role_policy_attachment" "ecs_execution" {
  role       = aws_iam_role.ecs_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}