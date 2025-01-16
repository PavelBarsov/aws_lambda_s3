terraform {
  source = "../../../modules/iam"
}

dependency "s3" {
  config_path = "../s3"
  mock_outputs = {
    bucket_name = "default"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]
}

inputs = {
  environment = "dev"
  s3_bucket   = "s3-lambda-tf"
  s3_prefix   = "website/dev"
  ro_s3_bucket  = dependency.s3.outputs.bucket_name
}

include {
  path = find_in_parent_folders()
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "s3-lambda-tf"
    key            = "dev/iam/terraform.tfstate"
    region         = "us-east-1"
  }
}
