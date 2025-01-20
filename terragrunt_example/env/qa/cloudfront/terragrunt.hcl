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
  environment             = "qa"
  api_gateway_domain_name = dependency.api_gateway.outputs.api_domain_url
  origin_id               = dependency.api_gateway.outputs.api_domain_url
  acm_certificate_domain  = "*.bpg-it.net"
  price_class             = "PriceClass_100"
}

include {
  path = find_in_parent_folders()
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "s3-lambda-tf"
    key            = "qa/cloudfront/terraform.tfstate"
    region         = "us-east-1"
  }
}
