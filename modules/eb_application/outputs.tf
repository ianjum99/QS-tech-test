output "eb_application_name" {
  value = aws_elastic_beanstalk_application.my_app.name
}

output "eb_environment_name" {
  value = aws_elastic_beanstalk_environment.my_env.name
}

output "eb_environment_hostname" {
  value = aws_elastic_beanstalk_environment.my_env.cname
}

