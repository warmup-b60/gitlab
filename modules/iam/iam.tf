
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

# Attach managed policies (add or modify as needed)
resource "aws_iam_role_policy_attachment" "ec2_attach_AmazonEC2ReadOnlyAccess" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

# Add more aws_iam_role_policy_attachment resources here for other policies as needed
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${var.iam_role_name}-profile"
  role = aws_iam_role.ec2_instance_role.name
}
