output "eb_application_name" {
  description = "The name of the Elastic Beanstalk application"
  value       = aws_elastic_beanstalk_application.my_app.name
}

output "eb_environment_name" {
  description = "The name of the Elastic Beanstalk environment"
  value       = aws_elastic_beanstalk_environment.my_env.name
}

output "eb_environment_hostname" {
  description = "The hostname of the Elastic Beanstalk environment"
  value       = aws_elastic_beanstalk_environment.my_env.cname
}
