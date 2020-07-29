# ---------------------------------------------------------------
#  VPC VARIABLES
# ---------------------------------------------------------------

variable "project_id" {
  description = "The project ID to host the VPC in"
  type        = string
}

variable network_name {
  description = "Name of the VPC."
  type        = string
}

variable routing_mode {
  description = "Routing mode. GLOBAL or REGIONAL"
  type        = string
  default     = "GLOBAL"
}

variable subnet_name {
  description = "Name of the subnet."
  type        = string
}

variable subnet_ip {
  description = "Subnet IP CIDR."
  type        = string
  default     = "10.0.0.0/17"
}

variable subnet_region {
  description = "Region subnet lives in."
  type        = string
}

variable subnet_private_access {
  description = "Enable private Google access"
  default     = "true"
  type        = string
}

variable subnet_flow_logs {
  description = "Whether to enable flow logging for the subnetwork."
  default     = "true"
  type        = string
}

variable description {
  description = "Subnet description"
  type        = string
  default     = "Deployed through Terraform."
}

variable "ip_range_pods" {
  description = "The secondary ip range to use for pods"
  type        = string
  default     = "192.168.0.0/18"
}

variable "ip_range_services" {
  description = "The secondary ip range to use for pods"
  type        = string
  default     = "192.168.64.0/18"
}

variable range_name_pods {
  description = "The range name for pods"
  type        = string
  default     = "kubernetes-pods"
}

variable range_name_services {
  description = "The range name for services"
  type        = string
  default     = "kubernetes-services"
}
