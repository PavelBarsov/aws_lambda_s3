dependency "lambda" {
  config_path = "../lambda"

  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]

  mock_outputs = {
    lambda_function_arn  = "arn:aws:lambda:us-east-1:123456789012:function:mock-lambda-function"
    lambda_function_name = "my-lambda"
  }
}

terraform {
  source = "../../../modules/api_gateway"
}

inputs ={ 
  lambda_function_arn  = dependency.lambda.outputs.lambda_function_arn
  lambda_function_name = dependency.lambda.outputs.lambda_function_name
}

include {
  path = find_in_parent_folders()
}
