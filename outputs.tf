output "network_name" {
  description = "Name of the VPC."
  value       = module.vpc.network_name
}

output "subnet_name" {
  description = "Name of the subnetwok."
  value       = module.vpc.subnets_names[0]
}

output "subnet_ip" {
  description = "Subnet IP"
  value       = module.vpc.subnets_ips[0]
}

output "routing_mode" {
  description = "Routing mode. GLOBAL or REGIONAL"
  value       = var.routing_mode
}
