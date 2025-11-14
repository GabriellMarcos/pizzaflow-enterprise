# Outputs for GabrielM infrastructure
output "student_info" {
  description = "Informações do estudante"
  value = {
    student_name = "gabrielm"
    student_id   = "004"
    project      = "PizzaFlow Enterprise"
    owner        = "Gabriel Marcos"
    professor    = "Adriano Machado"
    course       = "Continuous Integration/Deployment"
  }
}

output "infrastructure_summary" {
  description = "Resumo da infraestrutura criada"
  value = <<EOT
🎓 INFRAESTRUTURA AWS - GABRIEL MARCOS (ID: 004)

📦 S3 Bucket: pizzaflow-gabrielm-dev-static-assets
🗄️  RDS Database: pizzaflow-gabrielm-dev-database
🐳 ECS Cluster: pizzaflow-gabrielm-dev-cluster
📦 ECR Backend: pizzaflow-gabrielm-backend
📦 ECR Frontend: pizzaflow-gabrielm-frontend
📊 CloudWatch: /ecs/pizzaflow-gabrielm-dev
👤 IAM Role: pizzaflow-gabrielm-dev-ecs-execution-role

🏷️ Tags: StudentName=gabrielm, StudentID=004
👨‍💻 Desenvolvido por: Gabriel Marcos
👨‍🏫 Professor: Adriano Machado
EOT
}

output "resource_urls" {
  description = "URLs e endpoints dos recursos"
  value = {
    s3_bucket    = aws_s3_bucket.static_assets.bucket
    rds_endpoint = aws_db_instance.pizzaflow_db.endpoint
    ecr_backend  = aws_ecr_repository.backend.repository_url
    ecr_frontend = aws_ecr_repository.frontend.repository_url
    ecs_cluster  = aws_ecs_cluster.pizzaflow.name
  }
  sensitive = true
}# Outputs for GabrielM infrastructure
output "student_info" {
  description = "Informações do estudante"
  value = {
    student_name = "gabrielm"
    student_id   = "004"
    project      = "PizzaFlow Enterprise"
    owner        = "Gabriel Marcos"
    professor    = "Adriano Machado"
    course       = "Continuous Integration/Deployment"
  }
}

output "infrastructure_summary" {
  description = "Resumo da infraestrutura criada"
  value = <<EOT
🎓 INFRAESTRUTURA AWS - GABRIEL MARCOS (ID: 004)

📦 S3 Bucket: pizzaflow-gabrielm-dev-static-assets
🗄️  RDS Database: pizzaflow-gabrielm-dev-database
🐳 ECS Cluster: pizzaflow-gabrielm-dev-cluster
📦 ECR Backend: pizzaflow-gabrielm-backend
📦 ECR Frontend: pizzaflow-gabrielm-frontend
📊 CloudWatch: /ecs/pizzaflow-gabrielm-dev
👤 IAM Role: pizzaflow-gabrielm-dev-ecs-execution-role

🏷️ Tags: StudentName=gabrielm, StudentID=004
👨‍💻 Desenvolvido por: Gabriel Marcos
👨‍🏫 Professor: Adriano Machado
EOT
}

output "resource_urls" {
  description = "URLs e endpoints dos recursos"
  value = {
    s3_bucket    = aws_s3_bucket.static_assets.bucket
    rds_endpoint = aws_db_instance.pizzaflow_db.endpoint
    ecr_backend  = aws_ecr_repository.backend.repository_url
    ecr_frontend = aws_ecr_repository.frontend.repository_url
    ecs_cluster  = aws_ecs_cluster.pizzaflow.name
  }
  sensitive = true
}