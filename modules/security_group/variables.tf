variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "eb-instances-sg"
}

variable "allow_http" {
  description = "Indicates whether to allow HTTP traffic to the instances"
  type        = bool
  default     = true
}
