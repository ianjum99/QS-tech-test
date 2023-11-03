output "security_group_id" {
  description = "The ID of the Elastic Beanstalk instance security group."
  value       = aws_security_group.eb_instances_sg.id
}
