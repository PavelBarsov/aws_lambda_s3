variable "region" {
  description = "AWS Region for the resources"
  type        = string
}

variable "environment" {
  description = "env dev or qa"
  type        = string
}

variable "api_gateway_domain_name" {
  description = "domain name API Gateway"
  type        = string
}

variable "origin_id" {
  description = "origin id for cloudfront"
  type        = string
}

variable "acm_certificate_domain" {
  description = "domain cert"
  type        = string
}

variable "price_class" {
  description = "example PriceClass_100, PriceClass_200, PriceClass_All)"
  type        = string
  default     = "PriceClass_100"
}
