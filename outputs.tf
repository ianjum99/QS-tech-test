output "s3_bucket_id" {
  value = module.s3_bucket.bucket_id
}

output "eb_application_name" {
  value = module.eb_application.eb_application_name
}

output "eb_environment_name" {
  value = module.eb_application.eb_environment_name
}

output "security_group_id" {
  value = module.security_group.security_group_id
}
