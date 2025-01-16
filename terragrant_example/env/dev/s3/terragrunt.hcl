terraform {
  source = "../../../modules/s3"
}

inputs = {
  environment = "dev"
}

include {
  path = find_in_parent_folders()
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "s3-lambda-tf"
    key            = "dev/s3/terraform.tfstate"
    region         = "us-east-1"
  }
}