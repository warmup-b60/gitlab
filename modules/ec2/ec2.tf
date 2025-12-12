
resource "aws_instance" "agent" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]

  # Attach IAM instance profile if provided
  iam_instance_profile = var.agent_iam_instance_profile_name

  tags = {
    Name = "${var.name}-${var.env}"
  }
}

variable "security_group_id" {
  description = "The ID of the existing security group."
  type        = string
  default     = "sg-057e0b9b259713373"
}

# resource "aws_instance" "worker" {
#   ami                    = var.worker_ami_id
#   instance_type          = var.instance_type
#   vpc_security_group_ids = [var.security_group_id]

#   # Attach IAM instance profile if provided
#   iam_instance_profile = var.agent_iam_instance_profile_name

#   tags = {
#     Name = "${var.name}-agent-${var.env}"
#   }
# }