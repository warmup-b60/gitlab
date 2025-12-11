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