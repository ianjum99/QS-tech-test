variable "application_name" {
  description = "The name of the Elastic Beanstalk application"
  type        = string
}

variable "description" {
  description = "Description for the Elastic Beanstalk application"
  type        = string
}

variable "solution_stack_name" {
  description = "The name of the solution stack"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the Elastic Beanstalk environment"
  type        = string
}

variable "min_size" {
  description = "The minimum size of the Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "The maximum size of the Auto Scaling Group"
  type        = number
}

variable "vpc_id" {
  description = "The VPC ID for the security group"
  type        = string
}

