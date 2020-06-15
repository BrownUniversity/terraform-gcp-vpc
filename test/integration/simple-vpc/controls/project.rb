# copyright: 2018, The Authors

title "Test creation of a simple VPC"

project_id = attribute("project_id")
network_name = attribute("network_name")
subnet_name = attribute("subnet_name")
routing_mode = attribute("routing_mode")
subnet_region = attribute("subnet_region")
subnet_ip = attribute("subnet_ip")

describe google_compute_network(project: project_id,  name: network_name) do
  it { should exist }
  its('routing_config.routing_mode') { should cmp routing_mode }
  its ('subnetworks.count') { should eq 1 }
  its ('subnetworks.first') { should match subnet_name}
end

describe google_compute_subnetwork(project: project_id, region: subnet_region, name: subnet_name) do
  it { should exist }
  its('ip_cidr_range') { should eq subnet_ip }
  its('log_config.enable') { should be true }
  its('log_config.flow_sampling') { should cmp 0.7 }
  its('log_config.aggregation_interval') { should cmp 'INTERVAL_10_MIN' }
  its('log_config.metadata') { should include 'INCLUDE_ALL_METADATA' }
end