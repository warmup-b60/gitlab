resource "aws_security_group" "agent_allow_internal_pors" {
  name        = "allow_tls"
  description = "Allow inbound traffic and  outbound traffic"

  tags = {
    Name = "${var.name}-${var.env}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "agent_allow_tls_ipv4" {
  security_group_id = aws_security_group.agent_allow_internal_pors.id
  cidr_ipv4         = ["0.0.0.0/0"]
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "agent_allow_ssh_ipv6" {
  security_group_id = aws_security_group.agent_allow_internal_pors.id
  cidr_ipv4         = ["0.0.0.0/0"]
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "agent_all_traffic_ipv4" {
  security_group_id = aws_security_group.agent_allow_internal_pors.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}