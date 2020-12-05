output "logging_bucket_name" {
  value = aws_s3_bucket.logging.id
}

output "logging_bucket_domain_name" {
  value = aws_s3_bucket.logging.bucket_domain_name
}
