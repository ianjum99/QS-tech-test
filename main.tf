variable "region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}


module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "my-flask-app-source"
}

module "eb_application" {
  source              = "./modules/eb_application"
  application_name    = "flask-weather-app"
  description         = "Flask application for displaying weather data"
  solution_stack_name = "64bit Amazon Linux 2 v3.3.6 running Python 3.8"
  instance_type       = "t2.micro"
  min_size            = 2
  max_size            = 4
  vpc_id              = module.security_group.vpc_id
  sg_id               = module.security_group.security_group_id
  app_source_bucket   = module.s3_bucket.bucket_id
  app_source_key      = "flask_app.zip"          
}

module "security_group" {
  source  = "./modules/security_group"
  vpc_id  = "vpc-12345678" # Replace with actual VPC ID
}

output "application_url" {
  value = module.eb_application.eb_environment_hostname
}
