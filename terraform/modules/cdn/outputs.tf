output "website_domain_name" {
  value = aws_cloudfront_distribution.example_website.domain_name
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.example_website.id
}
