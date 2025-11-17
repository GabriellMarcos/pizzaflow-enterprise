# S3 Bucket para arquivos estáticos - GabrielM
resource "aws_s3_bucket" "static_assets" {
  bucket = "pizzaflow-gabrielm-dev-static-assets"

  tags = {
    Name        = "Static Assets - gabrielm"
    StudentName = "gabrielm"
    StudentID   = "004"
    Project     = "pizzaflow-gabrielm"
    Environment = "dev"
    Owner       = "Gabriel Marcos"
    Purpose     = "Frontend static files"
  }
}

resource "aws_s3_bucket_ownership_controls" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}