output "bucket_id" {
  description = "The ID (name) of the bucket."
  value       = aws_s3_bucket.app_source.id
}

output "bucket_arn" {
  description = "The ARN of the bucket."
  value       = aws_s3_bucket.app_source.arn
}

output "bucket_region" {
  description = "The region of the bucket."
  value       = aws_s3_bucket.app_source.region
}
