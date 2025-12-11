
# output "iam_role_name" {
#   value = aws_iam_role.ec2_instance_role.name
# }

output "agent_iam_instance_profile_name" {
  value = aws_iam_instance_profile.agent_ec2_instance_profile.name
}

output "worker_iam_instance_profile_name" {
  value = aws_iam_instance_profile.worker_ec2_instance_profile.name
}