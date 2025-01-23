terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()
    required_var_files = [
      find_in_parent_folders("common.tfvars")
    ]
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = var.region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
  
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "Test"
      Owner       = "Pavel Barsau"
  }
  }
}
EOF
}

generate "backend" {
  path = "backend.tf"
  if_exists = "overwrite"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket = "s3-lambda-tf"
    key    = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-1"
  }
}
EOF
}

inputs = {
  region      = "us-east-1" # default region
}