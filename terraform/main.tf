locals {
  tags = {
//    TODO
    "environment" = "DEV"
    "tf_workspace" = terraform.workspace
  }
}

module "static_origin" {
  source = "./modules/static_origin"
  logging_bucket = module.logging.logging_bucket_name
  logging_prefix = "static_s3_origin"
  tags = local.tags
}

module "cdn" {
  source = "./modules/cdn"
  origin_domain_name = module.static_origin.bucket_domain_name
  cloudfront_origin_access_identity = module.static_origin.cloudfront_origin_access_identity
  logging_bucket = module.logging.logging_bucket_domain_name
  logging_prefix = "cloudfront"
  tags = local.tags
}

module "logging" {
        source = "./modules/logging"
//  TODO
  bucket_name_prefix = "th-logging-202012"
  tags = local.tags
}