# Variables with default values - Everything ready for GabrielM
variable "student_name" {
  description = "Nome do estudante"
  type        = string
  default     = "gabrielm"
}

variable "student_id" {
  description = "ID do estudante"
  type        = string
  default     = "004"
}

variable "environment" {
  description = "Ambiente de deploy"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "pizzaflow-gabrielm"
}