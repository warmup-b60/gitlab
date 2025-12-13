agents = {
  frontend = {
    instance_type = "t3.micro"
    ami_id        = "ami-0fcc78c828f981df2"
    agent_ingress_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        description = "Allow SSH from anywhere"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        description = "Allow HTTPS for testing"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        description = "Allow HTTP for testing"
        cidr_blocks = ["172.0.0.0/24"]
      }
    ]
  }
  mongodb = {
    instance_type = "t2.micro"
    ami_id        = "ami-072983368f2a6eab5"
    agent_ingress_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        description = "Allow SSH from anywhere"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 27017
        to_port     = 27017
        protocol    = "tcp"
        description = "Allow MongoDB from anywhere"
        cidr_blocks =  ["0.0.0.0/0"]
      }
    ]
  }
  # catalogue = {
  #   instance_type = "t3.micro"
  #   ami_id        = "ami-072983368f2a6eab5"
  # }
}

# ami_id               = "ami-0fcc78c828f981df2"
env                  = "dev"
zone_id              = "Z056682820YKODKLCFUIZ"
zone_name            = "roboshop.internal"
agent_iam_role_name  = "dev-agent-ec2-instance-role"
worker_iam_role_name = "dev-worker-ec2-instance-role"
# iam_instance_profile_name = "dev-ec2-instance-profile" 

# Define the IAM actions required for the EC2 instances, ensure AWS Managed Roles are supplied in the iam.tf
agent_iam_actions = [
  "ec2:DescribeKeyPairs",
  "ec2:StartInstances",
  "ec2:StopInstances",
  "ec2:RunInstances",
  "ec2:RebootInstances",
  "ec2:TerminateInstances",
  "ec2:DescribeInstances",
  "ec2:DescribeTags",
  "ec2:CreateTags",
  "s3:PutObject",
  "s3:GetObject",
  "s3:GetObjectAcl",
  "s3:PutObjectAcl",
  "ssmmessages:CreateControlChannel",
  "ssmmessages:CreateDataChannel",
  "logs:CreateLogGroup",
  "logs:CreateLogStream",
  "logs:PutLogEvents",
  "logs:DescribeLogStreams",
  "logs:DescribeLogGroups",
  "logs:PutRetentionPolicy",
]

worker_iam_actions = [
  "logs:CreateLogGroup",
  "logs:CreateLogStream",
  "logs:PutLogEvents",
  "logs:DescribeLogStreams",
  "logs:DescribeLogGroups",
  "logs:PutRetentionPolicy",
]