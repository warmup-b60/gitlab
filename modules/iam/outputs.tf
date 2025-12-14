output "agent_iam_role_name" {
  value = aws_iam_role.agent_instance_role.name
}

output "worker_iam_role_name" {
  value = aws_iam_role.worker_instance_role.name
}

output "agent_iam_instance_profile_name" {
  value = aws_iam_instance_profile.agent_ec2_instance_profile.name
}

output "worker_iam_instance_profile_name" {
  value = aws_iam_instance_profile.worker_ec2_instance_profile.name
}

# output "agent_iam_role_arn" {
#   value = aws_iam_role.agent_instance_role.arn
# }

# output "worker_iam_role_arn" {
#   value = aws_iam_role.worker_instance_role.arn
# }

# output "agent_iam_role_policy_arn" {
#   value = aws_iam_role_policy.agent_instance_role_policy.arn
# }

# output "worker_iam_role_policy_arn" {
#   value = aws_iam_role_policy.worker_instance_role_policy.arn
# }

# output "agent_iam_role_policy_name" {
#   value = aws_iam_role_policy.agent_instance_role_policy.name
# }

# output "worker_iam_role_policy_name" {
#   value = aws_iam_role_policy.worker_instance_role_policy.name
# }

# output "agent_iam_role_policy_document" {
#   value = aws_iam_role_policy.agent_instance_role_policy.policy
# }

# output "worker_iam_role_policy_document" {
#   value = aws_iam_role_policy.worker_instance_role_policy.policy
# }

# output "agent_iam_role_policy_version_id" {
#   value = aws_iam_role_policy.agent_instance_role_policy.version_id
# } 

# output "worker_iam_role_policy_version_id" {
#   value = aws_iam_role_policy.worker_instance_role_policy.version_id
# }

# output "agent_iam_role_policy_default_version_id" {
#   value = aws_iam_role_policy.agent_instance_role_policy.default_version_id
# }

# output "worker_iam_role_policy_default_version_id" {
#   value = aws_iam_role_policy.worker_instance_role_policy.default_version_id
# }

# output "agent_iam_role_policy_policy_id" {
#   value = aws_iam_role_policy.agent_instance_role_policy.policy_id
# }