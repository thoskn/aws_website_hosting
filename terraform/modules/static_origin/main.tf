resource "aws_s3_bucket" "static_website" {
  bucket_prefix = "${var.environment}-my-example-website-"
  acl           = "private"

  logging {
    target_bucket = var.logging_bucket
    target_prefix = var.logging_prefix
  }

  tags = merge(
    var.tags,
    {
      tier = "static_website_origin"
    }
  )
}

resource "aws_s3_bucket_public_access_block" "static_website" {
  bucket                  = aws_s3_bucket.static_website.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "static_website" {
  bucket = aws_s3_bucket.static_website.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.static_website.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {}
