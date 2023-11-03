resource "aws_elastic_beanstalk_application" "my_app" {
  name        = var.application_name
  description = var.description
}

resource "aws_elastic_beanstalk_application_version" "my_version" {
  name        = "v1"
  application = aws_elastic_beanstalk_application.my_app.name
  description = "Version 1 of the app"

  source_bundle {
    s3_bucket = var.app_source_bucket
    s3_key    = var.app_source_key
  }
}

resource "aws_elastic_beanstalk_environment" "my_env" {
  name                = "${var.application_name}-env"
  application         = aws_elastic_beanstalk_application.my_app.name
  solution_stack_name = var.solution_stack_name
  version_label       = aws_elastic_beanstalk_application_version.my_version.name

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.min_size
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max_size
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = var.sg_id
  }
}

output "eb_environment_hostname" {
  value = aws_elastic_beanstalk_environment.my_env.cname
}

output "eb_environment_name" {
  value = aws_elastic_beanstalk_environment.my_env.name
}
