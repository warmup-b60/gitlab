instances = {
  frontend = {
    instance_type = "t3.micro"
  }
  mongodb = {
    instance_type = "te.micro"
  }
  catalogue = {
    instance_type = "t3.micro"
  }
}

ami_id    = "ami-0fcc78c828f981df2"
env       = "dev"
zone_id   = "Z056682820YKODKLCFUIZ"
zone_name = "roboshop.internal"