resource "aws_security_group" "agent_allow_internal_pors" {
  name        = "allow_tls"
  description = "Allow inbound traffic and  outbound traffic"

  tags = {
    Name = "${var.name}-${var.env}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "agent_allow_tls_ipv4" {
  security_group_id = aws_security_group.agent_allow_internal_pors.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "agent_allow_tls_ipv6" {
  security_group_id = aws_security_group.agent_allow_internal_pors.id
  cidr_ipv6         = aws_vpc.main.ipv6_cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "agent_all_traffic_ipv4" {
  security_group_id = aws_security_group.agent_allow_internal_pors.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}