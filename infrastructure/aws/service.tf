# Terraform para ECS Service
resource "aws_ecs_service" "pizzaflow_backend" {
  name            = "pizzaflow-backend-${var.environment}"
  cluster         = aws_ecs_cluster.pizzaflow.id
  task_definition = aws_ecs_task_definition.backend.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.backend.arn
    container_name   = "pizzaflow-api"
    container_port   = 3001
  }

  depends_on = [aws_lb_listener.backend]

  tags = {
    Environment = var.environment
    Service     = "backend"
  }
}

resource "aws_ecs_cluster" "pizzaflow" {
  name = "pizzaflow-cluster-${var.environment}"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_ecs_task_definition" "backend" {
  family                   = "pizzaflow-backend-${var.environment}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn           = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([{
    name      = "pizzaflow-api"
    image     = "${var.ecr_repository_url}:latest"
    essential = true

    portMappings = [{
      containerPort = 3001
      hostPort      = 3001
      protocol      = "tcp"
    }]

    environment = [
      { name = "NODE_ENV", value = var.environment },
      { name = "DB_HOST", value = aws_db_instance.pizzaflow_database.address },
      { name = "DB_PORT", value = tostring(aws_db_instance.pizzaflow_database.port) },
      { name = "DB_NAME", value = aws_db_instance.pizzaflow_database.db_name }
    ]

    secrets = [
      {
        name      = "DB_PASSWORD"
        valueFrom = aws_secretsmanager_secret.db_password.arn
      }
    ]

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = "/ecs/pizzaflow-backend"
        "awslogs-region"        = var.aws_region
        "awslogs-stream-prefix" = "ecs"
      }
    }
  }])

  tags = {
    Environment = var.environment
  }
}