# Configurações para ambiente de desenvolvimento
environment      = "development"
aws_region       = "us-east-1"
db_instance_class = "db.t3.micro"
db_username      = "pizzaflow_admin"
db_password      = "dev_password_123"
desired_count    = 1

# Configurações de rede (exemplo - substitua com seus valores)
vpc_id           = "vpc-12345678"
private_subnet_ids = ["subnet-11111111", "subnet-22222222"]
public_subnet_ids  = ["subnet-33333333", "subnet-44444444"]

domain_name      = "pizzaflow-dev.example.com"
ecr_repository_url = "123456789012.dkr.ecr.us-east-1.amazonaws.com/pizzaflow"