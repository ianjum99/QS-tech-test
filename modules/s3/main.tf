resource "aws_s3_bucket" "app_source" {
  bucket = var.bucket_name
  acl    = "private"
}

