output "cloudfront_distribution_id" {
  value       = aws_cloudfront_distribution.distribution.id
  description = "ID CloudFront Distribution"
}

output "cloudfront_domain_name" {
  value       = aws_cloudfront_distribution.distribution.domain_name
  description = "domain name CloudFront Distribution"
}
