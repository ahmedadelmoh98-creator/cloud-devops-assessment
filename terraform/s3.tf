resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "frontend" {
  bucket = "${var.project_name}-${var.environment}-frontend-${random_id.bucket_suffix.hex}"

  force_destroy = true

  tags = {
    Name = "${var.project_name}-${var.environment}-frontend"
  }
}

resource "aws_s3_bucket_ownership_controls" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid       = "PublicReadOnly"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"

        Resource = "${aws_s3_bucket.frontend.arn}/*"
      }
    ]
  })

  depends_on = [
    aws_s3_bucket_public_access_block.frontend
  ]
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.frontend.id
  key          = "index.html"
  source       = "${path.module}/../app/frontend/index.html"
  content_type = "text/html"

  etag = filemd5("${path.module}/../app/frontend/index.html")
}
