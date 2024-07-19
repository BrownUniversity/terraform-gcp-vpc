run "simple_vpc_test" {

  module {
    source = "./tests/simple-vpc/"
  }

  assert {
    condition     = module.simple-project.project_id != ""
    error_message = "Project ID should not be empty"
  }

  assert {
    condition     = output.network_name == "network-01"
    error_message = "Network name should be 'network-01'"
  }

  assert {
    condition     = output.subnet_name == "subnet-01"
    error_message = "Subnet name should be 'subnet-01'"
  }

  assert {
    condition     = output.subnet_region == "us-east1"
    error_message = "Subnet region should be 'us-east1'"
  }

  assert {
    condition     = output.routing_mode == "REGIONAL"
    error_message = "Routing mode should be 'REGIONAL'"
  }

  assert {
    condition     = can(cidrhost(output.subnet_ip, 0))
    error_message = "Subnet IP should be a valid CIDR block"
  }
}