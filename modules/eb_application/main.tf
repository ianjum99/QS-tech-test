ource "aws_elastic_beanstalk_application" "my_app" {
  name        = var.application_name
  description = var.description
}

resource "aws_elastic_beanstalk_environment" "my_env" {
  name                = "${var.application_name}-env"
  application         = aws_elastic_beanstalk_application.my_app.name
  solution_stack_name = var.solution_stack_name

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
    value     = module.security_group.security_group_id
  }
}

