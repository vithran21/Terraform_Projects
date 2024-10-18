#AWS S3 Bucket Configurations (Change Bucket name to unique name as needed)
resource "aws_s3_bucket" "viranbuckettf21" {
  bucket = "viranbuckettf21"

  lifecycle {
    prevent_destroy = false
  }
}

#Bucket Versioning Enabled
resource "aws_s3_bucket_versioning" "viranbucket_versioning" {
  bucket = aws_s3_bucket.viranbuckettf21.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Define a Bucket Policy to allow public access
resource "aws_s3_bucket_policy" "mys3bucket_policy" {
  bucket = aws_s3_bucket.viranbuckettf21.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.viranbuckettf21.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.viranbuckettf21_public_access]
}

# Create a Public Access Block Configuration for the S3 Bucket
resource "aws_s3_bucket_public_access_block" "viranbuckettf21_public_access" {
  bucket = aws_s3_bucket.viranbuckettf21.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Create S3 Bucket Ownership Controls as a separate resource
resource "aws_s3_bucket_ownership_controls" "mys3bucket_ownership" {
  bucket = aws_s3_bucket.viranbuckettf21.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

output "s3_bucket_name" {
  value = aws_s3_bucket.viranbuckettf21.bucket
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.viranbuckettf21.arn
}