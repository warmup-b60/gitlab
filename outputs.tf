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

# Worker AMI ID output
output "worker_ami_id" {
  value = module.ec2.worker_ami_id.value
}