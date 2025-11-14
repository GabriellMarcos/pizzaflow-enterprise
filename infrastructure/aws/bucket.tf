# Terraform para S3 Bucket - VERSÃO ATUALIZADA
resource "aws_s3_bucket" "pizzaflow_static" {
  bucket = "pizzaflow-static-assets-${var.environment}"

  tags = {
    Name        = "PizzaFlow Static Assets"
    Environment = var.environment
    Project     = "pizzaflow"
  }
}

# ACLs são deprecated - usar ownership controls
resource "aws_s3_bucket_ownership_controls" "pizzaflow_static_ownership" {
  bucket = aws_s3_bucket.pizzaflow_static.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Bucket abrindo para público (apenas para static assets)
resource "aws_s3_bucket_public_access_block" "pizzaflow_static_public" {
  bucket = aws_s3_bucket.pizzaflow_static.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "pizzaflow_static_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.pizzaflow_static_ownership,
    aws_s3_bucket_public_access_block.pizzaflow_static_public,
  ]

  bucket = aws_s3_bucket.pizzaflow_static.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "pizzaflow_static_versioning" {
  bucket = aws_s3_bucket.pizzaflow_static.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "pizzaflow_encryption" {
  bucket = aws_s3_bucket.pizzaflow_static.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Policy para acesso público aos arquivos estáticos
resource "aws_s3_bucket_policy" "pizzaflow_static_policy" {
  bucket = aws_s3_bucket.pizzaflow_static.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.pizzaflow_static.arn}/*"
      }
    ]
  })
}