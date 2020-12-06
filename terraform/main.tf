locals {
  tags = {
    "environment"  = var.environment
    "tf_workspace" = terraform.workspace
  }
}

module "static_origin" {
  source         = "./modules/static_origin"
  logging_bucket = module.logging.logging_bucket_name
  logging_prefix = "static_s3_origin/"
  environment    = var.environment
  tags           = local.tags
}

module "cdn" {
  source                            = "./modules/cdn"
  website_version                   = var.website_version
  origin_domain_name                = module.static_origin.bucket_domain_name
  cloudfront_origin_access_identity = module.static_origin.cloudfront_origin_access_identity
  logging_bucket                    = module.logging.logging_bucket_domain_name
  logging_prefix                    = "cloudfront"
  tags                              = local.tags
}

module "logging" {
  source      = "./modules/logging"
  environment = var.environment
  tags        = local.tags
}

module "monitoring" {
  source                     = "./modules/monitoring"
  environment                = var.environment
  cloudfront_distribution_id = module.cdn.cloudfront_distribution_id
  tags                       = local.tags
}
