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
# Worker should allow 22 and 443 only from the agent security group
resource "aws_security_group" "worker_sg" {
  name        = "${var.name}-${var.env}-worker-sg"
  description = "Allow SSH & HTTPS inbound traffic"
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

resource "aws_security_group_rule" "worker_allow_ssh_from_agent" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.worker_sg.id

  dynamic "source_security_group_id" {
    for_each = var.allowed_agent_sg_ids
    content {
      source_security_group_id = source_security_group_id.value
    }
  }
}

resource "aws_security_group_rule" "worker_allow_443_from_agent" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.worker_sg.id
  source_security_group_id = aws_security_group.agent_sg.id
}
