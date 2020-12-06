locals {
  s3_origin_id = "s3_origin"
}

resource "aws_cloudfront_distribution" "example_website" {
  comment = "Example of hosting a website"
  origin {
    domain_name = var.origin_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = var.cloudfront_origin_access_identity
    }
  }

  enabled             = true
  default_root_object = "${var.website_version}/index.html"

  custom_error_response {
    error_code         = 403
    response_code      = 404
    response_page_path = "/${var.website_version}/error.html"
  }

  logging_config {
    bucket = var.logging_bucket
    prefix = var.logging_prefix
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    default_ttl            = 3600
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = merge(var.tags, { website_version = var.website_version })

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
