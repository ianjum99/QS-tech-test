resource "aws_s3_bucket" "app_source" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "app_zip" {
  bucket       = aws_s3_bucket.app_source.bucket
  key          = var.app_source_key
  source       = "${var.source_directory}/flask_app.zip"
  etag         = filemd5("${var.source_directory}/flask_app.zip")
}
