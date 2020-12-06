resource "aws_s3_bucket" "logging" {
  acl           = "log-delivery-write"
  bucket_prefix = var.bucket_name_prefix

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
}
