output "lambda_function_name" {
  value = aws_lambda_function.lambda.function_name
}

output "lambda_function_arn" {
  description = "ARN Lambda"
  value       = aws_lambda_function.lambda.arn
}
