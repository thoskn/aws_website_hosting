variable "environment" {
  type        = string
  description = "The environment being deployed to, e.g DEV"
}

variable "website_version" {
  type        = string
  description = "The version of the website source code to use."
}
