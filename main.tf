provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "my-flask-app-source"
}

module "eb_application" {
  source            = "./modules/eb_application"
  application_name  = "flask-weather-app"
  description       = "Flask application for displaying weather data"
  solution_stack_name = "64bit Amazon Linux 2 v3.3.6 running Python 3.8"
  instance_type      = "t2.micro"
  min_size           = 2
  max_size           = 4
  vpc_id             = "vpc-12345678" # Replace with your actual VPC ID
}

module "security_group" {
  source  = "./modules/security_group"
  vpc_id = "vpc-12345678" # Replace with your actual VPC ID
}

output "application_url" {
  value = module.eb_application.eb_environment_hostname
}
