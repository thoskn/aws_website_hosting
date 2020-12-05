variable "origin_domain_name" {
  type        = string
  description = "The domain name of the origin"
}

variable "cloudfront_origin_access_identity" {
  type        = string
  description = "The identity allowing cloudfront access to the origin"
}

variable "logging_bucket" {
  type        = string
  description = "The name of the bucket to send logs to."
}

variable "logging_prefix" {
  type    = string
  default = "The prefix in the logging bucket under which to store the logs."
}

variable "tags" {
  type        = map(string)
  description = "Common tags for all resources"
}
