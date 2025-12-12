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

# Worker AMI ID output : Fix this
output "worker_ami_ids" {
  value = { for k, m in module.ec2 : k => m.worker_ami_id }
}