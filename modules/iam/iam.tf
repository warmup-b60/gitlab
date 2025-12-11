
resource "aws_iam_role" "ec2_instance_role" {
  name = var.iam_role_name
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
resource "aws_iam_policy" "custom_ec2_policy" {
  name        = "${var.iam_role_name}-custom-policy"
  description = "Custom policy for EC2, S3, and SSM actions"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = local.iam_actions
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "custom_policy_attachment" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = aws_iam_policy.custom_ec2_policy.arn
}

# Attach managed policies (add or modify as needed)
# resource "aws_iam_role_policy_attachment" "ec2_attach_AmazonEC2ReadOnlyAccess" {
#   role       = aws_iam_role.ec2_instance_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
# }

# Add more aws_iam_role_policy_attachment resources here for other policies as needed
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${var.iam_role_name}-profile"
  role = aws_iam_role.ec2_instance_role.name
}
