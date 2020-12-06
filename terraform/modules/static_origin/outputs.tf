output "bucket_domain_name" {
  value = aws_s3_bucket.static_website.bucket_regional_domain_name
}

output "bucket_name" {
  value = aws_s3_bucket.static_website.id
}

output "cloudfront_origin_access_identity" {
  value = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
}
