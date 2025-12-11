
resource "aws_iam_role" "agent_instance_role" {
  name = var.agent_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# Custom inline policy for specific permissions on EC2, S3, and SSM
resource "aws_iam_policy" "agent_custom_ec2_policy" {
  name        = "${var.agent_iam_role_name}-custom-policy"
  description = "Custom policy for EC2, S3, and SSM actions"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = var.agent_iam_actions
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "agent_custom_policy_attachment" {
  role       = aws_iam_role.agent_instance_role.name
  policy_arn = aws_iam_policy.agent_custom_ec2_policy.arn
}

# Mandatory AWS managed policy for SSM
resource "aws_iam_role_policy_attachment" "agent_ssm_managed_core" {
  role       = aws_iam_role.agent_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Add more aws_iam_role_policy_attachment resources here for other policies as needed
resource "aws_iam_instance_profile" "agent_ec2_instance_profile" {
  name = "${var.agent_iam_role_name}-profile"
  role = aws_iam_role.agent_instance_role.name
}
