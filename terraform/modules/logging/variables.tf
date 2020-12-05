variable "bucket_name_prefix" {
  type = string
  description = "The prefix for the name of the bucket"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for all resources"
}
