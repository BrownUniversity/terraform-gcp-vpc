output "network_name" {
  value = module.vpc.network_name
}

output "subnet_name" {
  value = "${module.vpc.subnets_names.0}"
}

output "subnet_ip" {
  value = "${module.vpc.subnets_ips.0}"
}

output "routing_mode" {
  value = var.routing_mode
}