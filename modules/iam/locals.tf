locals {
  iam_actions = [
    "ec2:DescribeKeyPairs",
    "ec2:StartInstances",
    "ec2:StopInstances",
    "ec2:RunInstances",
    "ec2:RebootInstances",
    "s3:PutObject",
    "s3:GetObject",
    "s3:GetObjectAcl",
    "s3:PutObjectAcl",
    "ssmmessages:CreateControlChannel",
    "ssmmessages:CreateDataChannel",
    "logs:CreateLogGroup",
    "logs:CreateLogStream",
    "logs:PutLogEvents"
    # Add more actions here
  ]
}