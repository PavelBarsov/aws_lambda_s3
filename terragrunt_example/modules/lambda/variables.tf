variable "environment" {
  description = "name env"
  type        = string
}

variable "s3_bucket" {
  description = "name s3"
  type        = string
}

variable "s3_key" {
  description = "file s3"
  type        = string
}

variable "iam_role_arn" {
  description = "ARN IAM role Lambda"
  type        = string
}

variable "region" {
  description = "AWS Region for the resources"
  type        = string
}
