# ECS Cluster - GabrielM
resource "aws_ecs_cluster" "pizzaflow" {
  name = "pizzaflow-gabrielm-dev-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name        = "ECS Cluster - gabrielm"
    StudentName = "gabrielm"
    StudentID   = "004"
    Project     = "pizzaflow-gabrielm"
    Environment = "dev"
    Owner       = "Gabriel Marcos"
    Purpose     = "Docker container orchestration"
  }
}

# ECR Repository para backend
resource "aws_ecr_repository" "backend" {
  name = "pizzaflow-gabrielm-backend"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "ECR Backend - gabrielm"
    StudentName = "gabrielm"
    StudentID   = "004"
    Project     = "pizzaflow-gabrielm"
    Environment = "dev"
    Owner       = "Gabriel Marcos"
    Purpose     = "Backend Docker images"
  }
}

# ECR Repository para frontend
resource "aws_ecr_repository" "frontend" {
  name = "pizzaflow-gabrielm-frontend"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "ECR Frontend - gabrielm"
    StudentName = "gabrielm"
    StudentID   = "004"
    Project     = "pizzaflow-gabrielm"
    Environment = "dev"
    Owner       = "Gabriel Marcos"
    Purpose     = "Frontend Docker images"
  }
}