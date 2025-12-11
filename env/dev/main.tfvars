instances = {
  frontend = {
    instance_type = "t3.micro"
  }
  mongodb = {
    instance_type = "t2.micro"
  }
  catalogue = {
    instance_type = "t3.micro"
  }
}

ami_id        = "ami-0fcc78c828f981df2"
env           = "dev"
zone_id       = "Z056682820YKODKLCFUIZ"
zone_name     = "roboshop.internal"
iam_role_name = "dev-ec2-instance-role"
# iam_instance_profile_name = "dev-ec2-instance-profile" 

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