resource "aws_iam_role" "lambda_role" {
  name = "${var.environment}-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name = "${var.environment}-lambda-combined-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "AllowS3Access"
        Effect   = "Allow"
        Action   = ["s3:GetObject"]
        Resource = "arn:aws:s3:::${var.s3_bucket}/${var.s3_prefix}/*"
      },
      {
        Sid      = "AllowS3ReadOnlyAccess"
        Effect   = "Allow"
        Action   = ["s3:GetObject"]
        Resource = "arn:aws:s3:::${var.ro_s3_bucket}/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}
#--------------------
# user role for s3 and lambda

resource "aws_iam_role" "user_role" {
  name = "${var.environment}-user-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "user_policy" {
  name = "${var.environment}-user-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowS3FullAccess"
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.ro_s3_bucket}",
          "arn:aws:s3:::${var.ro_s3_bucket}/*"
        ]
      },

      {
        Sid    = "AllowLambdaExecution"
        Effect = "Allow"
        Action = [
          "lambda:InvokeFunction",
          "lambda:GetFunction",
          "lambda:ListFunctions"
        ]
        Resource = "arn:aws:lambda:*:*:function:${var.environment}-*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "user_policy_attachment" {
  role       = aws_iam_role.user_role.name
  policy_arn = aws_iam_policy.user_policy.arn
}
