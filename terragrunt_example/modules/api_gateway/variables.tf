variable "lambda_function_arn" {
  description = "ARN Lambda"
  type        = string
}

variable "environment" {
  description = "name env"
  type        = string
}

variable "region" {
  description = "AWS Region for the resources"
  type        = string
}

variable "route_path" {
  description = "route path for api"
  type        = string
  default     = null
}

variable "lambda_function_name" {
  description = "name lamdba function"
  type        = string
}
