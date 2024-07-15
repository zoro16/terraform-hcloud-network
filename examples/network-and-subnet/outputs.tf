################################################
# Network
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network
################################################


output "network_id" {
  description = "Unique ID of the network."
  value       = module.net.network_id
}

output "network_name" {
  description = "Name of the network to be created (must be unique per project)."
  value       = module.net.network_name
}

output "network_ip_cidr_range" {
  description = "IP CIDR Range of the whole Network which must span all included subnets and route destinations. Must be one of the private ipv4 ranges of RFC1918."
  value       = module.net.network_ip_cidr_range
}

output "network_labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  value       = module.net.network_labels
}

output "network_delete_protection" {
  description = "Enable or disable delete protection."
  value       = module.net.network_delete_protection
}

output "network_expose_routes_to_vswitch" {
  description = "Enable or disable exposing the routes to the vSwitch connection. The exposing only takes effect if a vSwitch connection is active.."
  value       = module.net.network_expose_routes_to_vswitch
}

################################################
# Subnet
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_subnet
################################################


output "subnet_id" {
  description = "ID of the Network subnet."
  value       = module.net.subnet_id
}

output "subnet_network_id" {
  description = "ID of the Network the subnet should be added to."
  value       = module.net.subnet_network_id
}

output "subnet_type" {
  description = "Type of subnet e.g. `server`, `cloud` or `vswitch`."
  value       = module.net.subnet_type
}

output "subnet_ip_cidr_range" {
  description = "Range to allocate IPs from. Must be a subnet of the ip_range of the Network and must not overlap with any other subnets or with any destinations in routes."
  value       = module.net.subnet_ip_cidr_range
}

output "subnet_network_zone" {
  description = "Name of the network zone e.g. eu-central, us-east, us-west."
  value       = module.net.subnet_network_zone
}

output "subnet_vswitch_id" {
  description = "ID of the vswitch, Required if type is `vswitch`"
  value       = module.net.subnet_vswitch_id
}
