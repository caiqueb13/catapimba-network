resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "terraform-state-caique"

  tags = {
    Name        = "terraform-state-caique"
    Environment = "Dev"
  }
}

output "bucket-name" {
  value = aws_s3_bucket.terraform-bucket.id
}


output "bucket-arn" {
  value = aws_s3_bucket.terraform-bucket.arn
}
