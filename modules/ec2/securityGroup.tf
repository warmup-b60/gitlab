resource "aws_security_group" "agent_sg" {
  name        = "${var.name}-${var.env}-agent-sg"
  description = "Allow SSH & HTTPS inbound traffic"

  ingress {
    description = "Allows SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allows App Access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-${var.env}-agent-sg"
  }
}

# Worker should allow 22 and 443 only from the agent security group
resource "aws_security_group" "worker_sg" {
  name        = "${var.name}-${var.env}-worker-sg"
  description = "Allow SSH & HTTPS inbound traffic"

  ingress {
    description = "Allows SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_security_group.agent_sg.id]
  }

  ingress {
    description = "Allows App Access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_security_group.agent_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-${var.env}-worker-sg"
  }
}