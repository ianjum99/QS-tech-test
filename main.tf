provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "my-flask-app-source"
}

module "eb_application" {
  source          = "./modules/eb_application"
  application_name = "flask-weather-app"
  description      = "Flask application for displaying weather data"
  // Pass other required variables
}

module "security_group" {
  source  = "./modules/security_group"
  vpc_id = "vpc-12345678" // Replace with your actual VPC ID
}

# Use the outputs from your modules as needed
output "application_url" {
  value = module.eb_application.eb_environment_hostname
}

