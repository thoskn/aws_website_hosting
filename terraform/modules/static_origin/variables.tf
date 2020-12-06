variable "environment" {
  type        = string
  description = "The environment being deployed to."
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
