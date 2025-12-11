# This is to make sure workers pick the latest AMI available for ECS optimized Amazon Linux 2 with kernel 5.10
data "aws_ami" "worker_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-kernel-5.10-*-x86_64-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}