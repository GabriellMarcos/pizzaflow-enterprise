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
    }
  }
}

locals {
  resource_prefix = "pizzaflow-gabrielm-dev"
}