
variable "iam_role_name" {
  description = "Name of the IAM role to be created and attached to EC2 instances."
  type        = string
}

variable "iam_actions" {
  description = "List of IAM actions to allow in the custom policy"
  type        = list(string)
  default     = []
}