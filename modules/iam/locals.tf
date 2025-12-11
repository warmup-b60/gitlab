locals {
  iam_actions = [
    "ec2:DescribeKeyPairs",
    "ec2:StartInstances",
    "s3:PutObject",
    "ssmmessages:CreateControlChannel"
    # Add more actions here
  ]
}