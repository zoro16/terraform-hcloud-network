# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

locals {
  network_routes = tomap({
    "0.0.0.0/0" = "10.100.0.2"
  })
}

module "net" {
  source = "../../"

  create_network = true

  network_name                     = "example-network"
  network_ip_cidr_range            = "10.100.0.0/16"
  network_delete_protection        = false
  network_expose_routes_to_vswitch = false
  network_labels = {
    name        = "example-network"
    environment = "dev"
  }

  create_subnet         = true
  subnet_type           = "cloud"
  subnet_network_zone   = "eu-central"
  subnet_ip_cidr_ranges = ["10.100.20.0/24", "10.100.30.0/24"]

  create_network_route = true
  network_routes       = local.network_routes
}
