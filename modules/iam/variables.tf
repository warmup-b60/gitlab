
variable "agent_iam_role_name" {
  description = "Name of the IAM role to be created and attached to Agent EC2 instances."
  type        = string
}

variable "agent_iam_actions" {
  description = "List of IAM actions to allow in the custom policy by agent"
  type        = list(string)
  default     = []
}


variable "worker_iam_role_name" {
  description = "Name of the IAM role to be created and attached to Worker EC2 instances."
  type        = string
}

variable "worker_iam_actions" {
  description = "List of IAM actions to allow in the custom policy by worker"
  type        = list(string)
  default     = []
}