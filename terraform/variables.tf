variable "name" {
  type        = string
  description = "Bucket name (override default)"
}

variable "additional_tags" {
  type        = map(any)
  description = "Additional tag to merge with default tags"
}
