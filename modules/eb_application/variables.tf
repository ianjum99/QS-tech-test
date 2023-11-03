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

variable "sg_id" {
  description = "The ID of the security group"
  type        = string
}

variable "app_source_bucket" {
  description = "The name of the S3 bucket containing the application source bundle"
  type        = string
}

variable "app_source_key" {
  description = "The key of the S3 object containing the application source bundle"
  type        = string
}
