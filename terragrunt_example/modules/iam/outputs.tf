output "iam_role_arn" {
  value = aws_iam_role.lambda_role.arn
}

output "user_role_arn" {
  value = aws_iam_role.user_role.arn
}
