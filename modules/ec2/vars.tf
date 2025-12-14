variable "ami_id" {}
variable "instance_type" {}
variable "name" {}
variable "env" {}

variable "zone_id" {}
variable "zone_name" {}

variable "agent_iam_instance_profile_name" {
  description = "The name of the IAM instance profile to attach to Agent EC2 instances."
  type        = string
  default     = null
}

variable "worker_ami_id" {
  description = "AMI ID for worker"
  type        = string
}

variable "agent_ingress_rules" {
  description = "A list of ingress rules for the agent security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = optional(string)
    cidr_blocks = list(string)
  }))
  default = []
}