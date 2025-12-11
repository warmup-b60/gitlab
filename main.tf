module "ec2" {
  for_each = var.instances

  source                           = "./modules/ec2"
  ami_id                           = var.ami_id
  instance_type                    = each.value["instance_type"]
  env                              = var.env
  name                             = each.key
  zone_id                          = var.zone_id
  zone_name                        = var.zone_name
  agent_iam_instance_profile_name  = module.iam.agent_iam_instance_profile_name
  worker_iam_instance_profile_name = module.iam.worker_iam_instance_profile_name
}


module "iam" {
  source               = "./modules/iam"
  agent_iam_role_name  = var.agent_iam_role_name
  agent_iam_actions    = var.agent_iam_actions
  worker_iam_role_name = var.worker_iam_role_name
  worker_iam_actions   = var.worker_iam_actions
}