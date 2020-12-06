variable "environment" {
  type        = string
  description = "The environment being deployed to."
}

variable "cloudfront_distribution_id" {
  type        = string
  description = "The Id of the cloudfront distribution to monitor."
}

variable "tags" {
  type        = map(string)
  description = "Common tags for all resources"
}
