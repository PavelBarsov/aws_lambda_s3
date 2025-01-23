terraform {
  source = "../../../modules/cloudfront"
}

dependency "api_gateway" {
  config_path = "../api_gateway"

  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]

  mock_outputs = {
    api_domain_url = "execute-api.us-east-1.amazonaws.com"
  }
}

inputs = {
  api_gateway_domain_name = dependency.api_gateway.outputs.api_domain_url
  origin_id               = dependency.api_gateway.outputs.api_domain_url
  acm_certificate_domain  = "*.bpg-it.net"
  price_class             = "PriceClass_100"
}

include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}
