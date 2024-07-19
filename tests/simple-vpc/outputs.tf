output "project_id" {
  value = module.simple-project.project_id
}

output "network_name" {
  value = local.network_name
}

output "subnet_name" {
  value = local.subnet_name
}

output "subnet_region" {
  value = local.subnet_region
}

output "routing_mode" {
  value = local.routing_mode
}

output "subnet_ip" {
  value = module.simple-vpc.subnet_ip
}