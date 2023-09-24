# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
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

  create_subnet        = true
  subnet_network_id    = module.net.network_id
  subnet_type          = "cloud"
  subnet_network_zone  = "eu-central"
  subnet_ip_cidr_range = "10.100.20.0/24"
}
