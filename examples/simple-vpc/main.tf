module "simple-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 8.0"

  name                = "inspec-vpc"
  folder_id           = var.folder_id
  random_project_id   = "true"
  org_id              = var.org_id
  billing_account     = var.billing_account
}

module "simple-vpc" {
  source                     = "../.."

  project_id                 = module.simple-project.project_id
  subnet_region              = "us-east1"
}



