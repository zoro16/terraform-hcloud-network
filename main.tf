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
  for_each = var.create_subnet ? toset(var.subnet_ip_cidr_ranges) : []

  network_id   = hcloud_network.network[0].id
  type         = var.subnet_type
  network_zone = var.subnet_network_zone
  ip_range     = each.key
}

################################################
# Network Route
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_route
################################################

resource "hcloud_network_route" "private_net" {
  for_each = var.create_network_route ? var.network_routes : {}

  network_id  = hcloud_network.network[0].id
  destination = each.key
  gateway     = each.value
}
