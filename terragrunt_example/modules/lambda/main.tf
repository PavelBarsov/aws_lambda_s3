resource "aws_lambda_function" "lambda" {
  function_name = "my-lambda-${var.environment}"
  role          = var.iam_role_arn
  handler       = "app.lambda_handler"
  runtime       = "python3.9"

  s3_bucket = var.s3_bucket
  s3_key    = var.s3_key

  environment {
    variables = {
      ENV = var.environment
    }
  }

  tags = {
    Environment = var.environment
  }
}
