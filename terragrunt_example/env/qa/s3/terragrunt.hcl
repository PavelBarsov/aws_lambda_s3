terraform {
  source = "../../../modules/s3"
}

inputs = {
  environment = "qa"
}

include {
  path = find_in_parent_folders()
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "s3-lambda-tf"
    key            = "qa/s3/terraform.tfstate"
    region         = "us-east-1"
  }
}