resource "aws_security_group" "agent_sg" {
  name        = "${var.name}-${var.env}-agent-sg"
  description = "Allow SSH & HTTPS inbound traffic"

  dynamic "ingress" {
    for_each = var.agent_ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
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

# This will allow SSH and HTTPS traffic from the agent security group to the worker security group
resource "aws_security_group_rule" "worker_allow_ssh_from_agent" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.worker_sg.id
  source_security_group_id = aws_security_group.agent_sg.id
}

resource "aws_security_group_rule" "worker_allow_443_from_agent" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.worker_sg.id
  source_security_group_id = aws_security_group.agent_sg.id
}
