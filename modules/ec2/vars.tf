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