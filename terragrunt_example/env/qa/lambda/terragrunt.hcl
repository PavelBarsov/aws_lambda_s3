terraform {
  source = "../../../modules/lambda"
}

dependency "iam" {
  config_path = "../iam"
  mock_outputs = {
    iam_role_arn = "arn:aws:iam::123456789012:role/mock-role"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]
}

dependency "s3" {
  config_path = "../s3"
  mock_outputs = {
    ro_s3_bucket = "default"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]
}

inputs = {
  s3_bucket     = "s3-lambda-tf"
  s3_key        = "website/qa/lambda.zip"
  iam_role_arn  = dependency.iam.outputs.iam_role_arn
}

include {
  path = find_in_parent_folders()
}

include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}
