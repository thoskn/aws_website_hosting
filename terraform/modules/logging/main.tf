resource "aws_s3_bucket" "logging" {
  acl           = "log-delivery-write"
  bucket_prefix = "${var.environment}-logging-"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = merge(
    var.tags,
    {
      tier = "logging"
    }
  )
}

resource "aws_s3_bucket_public_access_block" "logging" {
  bucket                  = aws_s3_bucket.logging.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
