variable "agents" {
  description = "Map of agent configurations"
  type        = map(object({}))
}
variable "env" {
  type        = string
  description = "Environment name"
}
variable "zone_id" {
  type        = string
  description = "Zone ID"
}
variable "zone_name" {
  type        = string
  description = "Zone name"
}
variable "agent_iam_role_name" {
  type        = string
  description = "IAM role name for agents"
}
variable "agent_iam_actions" {
  type        = list(string)
  description = "IAM actions for agents"
}
variable "worker_iam_role_name" {
  type        = string
  description = "IAM role name for workers"
}
variable "worker_iam_actions" {
  type        = list(string)
  description = "IAM actions for workers"
}