output "api_url" {
  description = "URL API Gateway"
  value       = "${aws_apigatewayv2_api.rest_api.api_endpoint}/${var.environment}/${var.lambda_function_name}"
}

output "api_domain_url" {
  description = "URL domain API Gateway"
  value       = replace(aws_apigatewayv2_api.rest_api.api_endpoint, "https://", "")
}
