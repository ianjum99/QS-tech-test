resource "aws_s3_bucket" "app_source" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Application Source Bucket"
    Environment = "my_ENV"
  }
}

resource "aws_s3_bucket_object" "app_zip" {
  bucket = aws_s3_bucket.app_source.bucket
  key    = "flask_app.zip"
  source = var.source_path  
  etag   = filemd5(var.source_path)  

  acl = "private"
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.app_source.arn
}

output "s3_bucket_id" {
  value = aws_s3_bucket.app_source.id
}

output "app_zip_s3_key" {
  value = aws_s3_bucket_object.app_zip.key
}
