output "website_domain_name" {
  value = module.cdn.website_domain_name
}

output "origin_bucket_name" {
  value = module.static_origin.bucket_name
}
