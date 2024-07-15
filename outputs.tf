################################################
# Network
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network
################################################


output "network_id" {
  description = "Unique ID of the network."
  value       = try(hcloud_network.network[0].id, hcloud_network.network[*].id, "")
}

output "network_name" {
  description = "Name of the network to be created (must be unique per project)."
  value       = try(hcloud_network.network[0].name, hcloud_network.network[*].name, "")
}

output "network_ip_cidr_range" {
  description = "IP CIDR Range of the whole Network which must span all included subnets and route destinations. Must be one of the private ipv4 ranges of RFC1918."
  value       = try(hcloud_network.network[0].ip_range, hcloud_network.network[*].ip_range, "")
}

output "network_labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  value       = try(hcloud_network.network[0].labels, hcloud_network.network[*].labels, null)
}

output "network_delete_protection" {
  description = "Enable or disable delete protection."
  value       = try(hcloud_network.network[0].delete_protection, hcloud_network.network[*].delete_protection, false)
}

output "network_expose_routes_to_vswitch" {
  description = "Enable or disable exposing the routes to the vSwitch connection. The exposing only takes effect if a vSwitch connection is active.."
  value       = try(hcloud_network.network[0].expose_routes_to_vswitch, hcloud_network.network[*].expose_routes_to_vswitch, false)
}

################################################
# Subnet
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_subnet
################################################


output "subnet_id" {
  description = "ID of the Network subnet."
  value       = toset([
    for v in hcloud_network_subnet.subnet : v.id
  ])
}

output "subnet_network_id" {
  description = "ID of the Network the subnet should be added to."
  value       = join(",", toset([for v in hcloud_network_subnet.subnet : v.network_id]))
}

output "subnet_type" {
  description = "Type of subnet e.g. `server`, `cloud` or `vswitch`."
  value       = join(",", toset([for v in hcloud_network_subnet.subnet : v.type]))
}

output "subnet_ip_cidr_range" {
  description = "Range to allocate IPs from. Must be a subnet of the ip_range of the Network and must not overlap with any other subnets or with any destinations in routes."
  value       = [for v in hcloud_network_subnet.subnet : v.ip_range]
}

output "subnet_network_zone" {
  description = "Name of the network zone e.g. eu-central, us-east, us-west."
  value       = join(",", toset([for v in hcloud_network_subnet.subnet : v.network_zone]))
}

output "subnet_vswitch_id" {
  description = "ID of the vswitch, Required if type is `vswitch`"
  value       = try(
    join(",", toset([for v in hcloud_network_subnet.subnet : v.vswitch_id])),
    ""
    )

  precondition {
    condition     = (var.subnet_type == "vswitch" && var.subnet_vswitch_id == null) ? false : true
    error_message = "`subnet_vswitch_id` must be set if the `subnet_type` is `vswitch`."
  }
}


################################################
# Network Route
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_route
################################################


output "network_route_id" {
  description = "ID of the Network the route should be added to."
  value       = [for v in hcloud_network_route.private_net : v.id]
}

output "network_route_network_id" {
  description = "ID of the Network the route should be added to."
  value       = join(",", [for v in hcloud_network_route.private_net : v.network_id])
}

output "network_route_destination" {
  description = "Destination network or host of this route. Must be a subnet of the ip_range of the Network. Must not overlap with an existing ip_range in any subnets or with any destinations in other routes or with the first ip of the networks ip_range or with 172.31.1.1."
  value       = [for v in hcloud_network_route.private_net : v.destination]
}

output "network_route_gateway" {
  description = "Gateway for the route. Cannot be the first ip of the networks ip_range and also cannot be 172.31.1.1 as this IP is being used as a gateway for the public network interface of servers."
  value       = [for v in hcloud_network_route.private_net : v.gateway]
}
