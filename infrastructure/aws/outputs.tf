output "backend_url" {
  description = "URL do backend API"
  value       = "https://${aws_lb.pizzaflow.dns_name}"
}

output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = aws_db_instance.pizzaflow_database.endpoint
  sensitive   = true
}

output "s3_bucket_name" {
  description = "Nome do bucket S3 para assets estáticos"
  value       = aws_s3_bucket.pizzaflow_static.bucket
}

output "load_balancer_dns" {
  description = "DNS name do Load Balancer"
  value       = aws_lb.pizzaflow.dns_name
}

output "ecs_cluster_name" {
  description = "Nome do cluster ECS"
  value       = aws_ecs_cluster.pizzaflow.name
}

output "database_name" {
  description = "Nome do banco de dados"
  value       = aws_db_instance.pizzaflow_database.db_name
}

output "security_group_ids" {
  description = "IDs dos Security Groups criados"
  value = {
    lb_sg  = aws_security_group.lb_sg.id
    ecs_sg = aws_security_group.ecs_sg.id
    rds_sg = aws_security_group.rds_sg.id
  }
}
output "backend_url" {
  description = "URL do backend API"
  value       = "https://${aws_lb.pizzaflow.dns_name}"
}

output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = aws_db_instance.pizzaflow_database.endpoint
  sensitive   = true
}

output "s3_bucket_name" {
  description = "Nome do bucket S3 para assets estáticos"
  value       = aws_s3_bucket.pizzaflow_static.bucket
}

output "load_balancer_dns" {
  description = "DNS name do Load Balancer"
  value       = aws_lb.pizzaflow.dns_name
}

output "ecs_cluster_name" {
  description = "Nome do cluster ECS"
  value       = aws_ecs_cluster.pizzaflow.name
}

output "database_name" {
  description = "Nome do banco de dados"
  value       = aws_db_instance.pizzaflow_database.db_name
}

output "security_group_ids" {
  description = "IDs dos Security Groups criados"
  value = {
    lb_sg  = aws_security_group.lb_sg.id
    ecs_sg = aws_security_group.ecs_sg.id
    rds_sg = aws_security_group.rds_sg.id
  }
}