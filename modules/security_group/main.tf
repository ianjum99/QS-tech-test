variable "vpc_id" {
  description = "The VPC ID to create the security group in."
  type        = string
}

variable "sg_name" {
  description = "The name of the security group."
  default     = "eb-instances-sg"
}

variable "egress_rules" {
  description = "List of maps containing egress rules."
  type        = list(any)
  default     = [{
    from_port   = 0,
    to_port     = 0,
    protocol    = "-1",
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

resource "aws_security_group" "eb_instances_sg" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}

output "security_group_id" {
  description = "The ID of the security group."
  value       = aws_security_group.eb_instances_sg.id
}
