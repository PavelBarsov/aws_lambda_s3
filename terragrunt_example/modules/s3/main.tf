resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket = "s3-${var.environment}-${random_id.bucket_suffix.hex}"

  tags = {
    Environment = var.environment
  }
}
