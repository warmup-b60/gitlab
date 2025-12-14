
# This is to make sure workers pick the latest AMI available for ECS optimized Amazon Linux 2 with kernel 5.10
output "worker_ami_id" {
  value = var.worker_ami_id
}

output "agent_sg_id" {
  value = aws_security_group.agent_sg.id
}
