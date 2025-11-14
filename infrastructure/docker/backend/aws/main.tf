# Main Terraform configuration - GabrielM
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      StudentName = "gabrielm"
      StudentID   = "004"
      Project     = "pizzaflow-gabrielm"
      Environment = "dev"
      Owner       = "Gabriel Marcos"
      ManagedBy   = "terraform"
      Course      = "CI-CD"
      Professor   = "Adriano Machado"
    }
  }
}

# Local values
locals {
  resource_prefix = "pizzaflow-gabrielm-dev"
  common_tags = {
    StudentName = "gabrielm"
    StudentID   = "004"
    Project     = "pizzaflow-gabrielm"
    Environment = "dev"
    Owner       = "Gabriel Marcos"
    ManagedBy   = "terraform"
  }
}