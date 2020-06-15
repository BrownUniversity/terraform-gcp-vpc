module "simple-project" {
  source  = "git@github.com:BrownUniversity/terraform-gcp-project.git"

  name                = "inspec-vpc"
  folder_id           = var.folder_id
  random_project_id   = "true"
  org_id              = var.org_id
  billing_account     = var.billing_account
}

module "simple-vpc" {
  source                     = "../.."
  project_id                 = module.simple-project.project_id
  network_name               = "network-01"
  subnet_name                = "subnet-01"
  subnet_region              = "us-east1"
}



