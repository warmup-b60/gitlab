agents = {
  frontend = {
    instance_type = "t3.micro"
    agent_ingress_rules = [
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        description = "Allow HTTPS from our office"
        cidr_blocks = ["YOUR_OFFICE_IP/32"]
      }
    ]
  }
  mongodb = {
    instance_type = "t3.micro"
  }
  catalogue = {
    instance_type = "t3.micro"
  }
  redis = {
    instance_type = "t3.micro"
  }
  cart = {
    instance_type = "t3.micro"
  }
  user = {
    instance_type = "t3.micro"
  }
  mysql = {
    instance_type = "t3.micro"
  }
  shipping = {
    instance_type = "t3.micro"
  }
  payment = {
    instance_type = "t3.micro"
  }
  rabbitmq = {
    instance_type = "t3.medium"
  }
}

ami_id    = "ami-0fcc78c828f981df2"
env       = "dev"
zone_id   = "Z0037423Y1UIUBRWU8AE"
zone_name = "thecloudcareers.com"