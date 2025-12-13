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

variable "agents" {
  type = map(object({
    instance_type       = string
    ami_id              = string
    agent_ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      description = string
      cidr_blocks = list(string)
    }))
  }))
}