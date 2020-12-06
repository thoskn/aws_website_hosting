variable "environment" {
  type        = string
  description = "The environment being deployed to."
}

variable "tags" {
  type        = map(string)
  description = "Common tags for all resources"
}
