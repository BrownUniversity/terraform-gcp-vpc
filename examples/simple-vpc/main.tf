locals {
  network_name = "network-01"
  subnet_name = "subnet-01"
  subnet_region = "us-east1"
  routing_mode = "REGIONAL"
}

module "simple-project" {
  source  = "git@github.com:BrownUniversity/terraform-gcp-project.git"

  project_name        = "inspec-vpc"
  folder_id           = var.folder_id
  billing_account     = var.billing_account
  activate_apis       = []
}

module "simple-vpc" {
  source                     = "../.."
  project_id                 = module.simple-project.project_id
  network_name               = local.network_name
  subnet_name                = local.subnet_name
  subnet_region              = local.subnet_region
  routing_mode               = local.routing_mode
}



