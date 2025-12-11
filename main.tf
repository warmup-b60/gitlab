module "ec2" {
  for_each = var.instances

  source                    = "./modules/ec2"
  ami_id                    = var.ami_id
  instance_type             = each.value["instance_type"]
  env                       = var.env
  name                      = each.key
  zone_id                   = var.zone_id
  zone_name                 = var.zone_name
  iam_instance_profile_name = module.iam.iam_instance_profile_name
}


module "iam" {
  source        = "./modules/iam"
  iam_role_name = var.iam_role_name
  iam_actions   = var.iam_actions
}

