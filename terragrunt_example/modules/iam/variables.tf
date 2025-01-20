variable "environment" {
  description = "name env"
  type        = string
}

variable "s3_bucket" {
  description = "name s3"
  type        = string
}

variable "s3_prefix" {
  description = "prefix s3"
  type        = string
}

variable "region" {
  description = "AWS Region for the resources"
  type        = string
}

variable "ro_s3_bucket" {
  description = "name s3 which created"
  type        = string
}
