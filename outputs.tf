output "agent_iam_role_name" {
  value = module.iam.agent_iam_role_name
}

output "worker_iam_role_name" {
  value = module.iam.worker_iam_role_name
}

output "agent_iam_instance_profile_name" {
  value = module.iam.agent_iam_instance_profile_name
}

output "worker_iam_instance_profile_name" {
  value = module.iam.worker_iam_instance_profile_name
}

# output "worker_ami_id" {
#   value = data.aws_ami.worker_ami.id
# }