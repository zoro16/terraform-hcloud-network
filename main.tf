################################################
# Network
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network
################################################

resource "hcloud_network" "network" {
  count = var.create_network ? 1 : 0

  name                     = var.network_name
  ip_range                 = var.network_ip_cidr_range
  delete_protection        = var.network_delete_protection
  expose_routes_to_vswitch = var.network_expose_routes_to_vswitch
  labels                   = var.network_labels
}

################################################
# Subnet
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_subnet
################################################

resource "hcloud_network_subnet" "subnet" {
  count = var.create_subnet ? 1 : 0

  network_id   = var.subnet_network_id
  type         = var.subnet_type
  network_zone = var.subnet_network_zone
  ip_range     = var.subnet_ip_cidr_range
}

################################################
# Network Route
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_route
################################################

resource "hcloud_network_route" "private_net" {
  count = var.create_network_route ? 1 : 0

  network_id  = var.network_route_network_id
  destination = var.network_route_destination
  gateway     = var.network_route_gateway
}
