## Description

Terraform module to help with provisioning `Network`, `Subnet` and `Network Route` resources in Hetzner Cloud.

## Usage

```hcl
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
```



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.42.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | >= 1.42.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_network.network](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network) | resource |
| [hcloud_network_route.private_net](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_route) | resource |
| [hcloud_network_subnet.subnet](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_network"></a> [create\_network](#input\_create\_network) | A boolean to check whether to create a network resource or not. | `bool` | `false` | no |
| <a name="input_create_network_route"></a> [create\_network\_route](#input\_create\_network\_route) | A boolean to check whether to create a Network Route resource or not. | `bool` | `false` | no |
| <a name="input_create_subnet"></a> [create\_subnet](#input\_create\_subnet) | A boolean to check whether to create a subent resource or not. | `bool` | `false` | no |
| <a name="input_network_delete_protection"></a> [network\_delete\_protection](#input\_network\_delete\_protection) | Enable or disable delete protection. | `bool` | `false` | no |
| <a name="input_network_expose_routes_to_vswitch"></a> [network\_expose\_routes\_to\_vswitch](#input\_network\_expose\_routes\_to\_vswitch) | Enable or disable exposing the routes to the vSwitch connection. The exposing only takes effect if a vSwitch connection is active.. | `bool` | `false` | no |
| <a name="input_network_ip_cidr_range"></a> [network\_ip\_cidr\_range](#input\_network\_ip\_cidr\_range) | IP CIDR Range of the whole Network which must span all included subnets and route destinations. Must be one of the private ipv4 ranges of RFC1918. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_network_labels"></a> [network\_labels](#input\_network\_labels) | User-defined labels (key-value pairs) should be created with. | `map(any)` | `{}` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the network to be created (must be unique per project). | `string` | `""` | no |
| <a name="input_network_route_destination"></a> [network\_route\_destination](#input\_network\_route\_destination) | Destination network or host of this route. Must be a subnet of the ip\_range of the Network. Must not overlap with an existing ip\_range in any subnets or with any destinations in other routes or with the first ip of the networks ip\_range or with 172.31.1.1. | `string` | `null` | no |
| <a name="input_network_route_gateway"></a> [network\_route\_gateway](#input\_network\_route\_gateway) | Gateway for the route. Cannot be the first ip of the networks ip\_range and also cannot be 172.31.1.1 as this IP is being used as a gateway for the public network interface of servers. | `string` | `null` | no |
| <a name="input_network_route_network_id"></a> [network\_route\_network\_id](#input\_network\_route\_network\_id) | ID of the Network the route should be added to. | `number` | `null` | no |
| <a name="input_subnet_ip_cidr_range"></a> [subnet\_ip\_cidr\_range](#input\_subnet\_ip\_cidr\_range) | Range to allocate IPs from. Must be a subnet of the ip\_range of the Network and must not overlap with any other subnets or with any destinations in routes. | `string` | `"10.0.0.0/24"` | no |
| <a name="input_subnet_network_id"></a> [subnet\_network\_id](#input\_subnet\_network\_id) | ID of the Network the subnet should be added to. | `number` | `null` | no |
| <a name="input_subnet_network_zone"></a> [subnet\_network\_zone](#input\_subnet\_network\_zone) | Name of the network zone e.g. eu-central, us-east, us-west. | `string` | `null` | no |
| <a name="input_subnet_type"></a> [subnet\_type](#input\_subnet\_type) | Type of subnet e.g. `server`, `cloud` or `vswitch`. | `string` | `null` | no |
| <a name="input_subnet_vswitch_id"></a> [subnet\_vswitch\_id](#input\_subnet\_vswitch\_id) | ID of the vswitch, Required if type is `vswitch` | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_delete_protection"></a> [network\_delete\_protection](#output\_network\_delete\_protection) | Enable or disable delete protection. |
| <a name="output_network_expose_routes_to_vswitch"></a> [network\_expose\_routes\_to\_vswitch](#output\_network\_expose\_routes\_to\_vswitch) | Enable or disable exposing the routes to the vSwitch connection. The exposing only takes effect if a vSwitch connection is active.. |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | Unique ID of the network. |
| <a name="output_network_ip_cidr_range"></a> [network\_ip\_cidr\_range](#output\_network\_ip\_cidr\_range) | IP CIDR Range of the whole Network which must span all included subnets and route destinations. Must be one of the private ipv4 ranges of RFC1918. |
| <a name="output_network_labels"></a> [network\_labels](#output\_network\_labels) | User-defined labels (key-value pairs) should be created with. |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Name of the network to be created (must be unique per project). |
| <a name="output_network_route_destination"></a> [network\_route\_destination](#output\_network\_route\_destination) | Destination network or host of this route. Must be a subnet of the ip\_range of the Network. Must not overlap with an existing ip\_range in any subnets or with any destinations in other routes or with the first ip of the networks ip\_range or with 172.31.1.1. |
| <a name="output_network_route_gateway"></a> [network\_route\_gateway](#output\_network\_route\_gateway) | Gateway for the route. Cannot be the first ip of the networks ip\_range and also cannot be 172.31.1.1 as this IP is being used as a gateway for the public network interface of servers. |
| <a name="output_network_route_id"></a> [network\_route\_id](#output\_network\_route\_id) | ID of the Network the route should be added to. |
| <a name="output_network_route_network_id"></a> [network\_route\_network\_id](#output\_network\_route\_network\_id) | ID of the Network the route should be added to. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID of the Network subnet. |
| <a name="output_subnet_ip_cidr_range"></a> [subnet\_ip\_cidr\_range](#output\_subnet\_ip\_cidr\_range) | Range to allocate IPs from. Must be a subnet of the ip\_range of the Network and must not overlap with any other subnets or with any destinations in routes. |
| <a name="output_subnet_network_id"></a> [subnet\_network\_id](#output\_subnet\_network\_id) | ID of the Network the subnet should be added to. |
| <a name="output_subnet_network_zone"></a> [subnet\_network\_zone](#output\_subnet\_network\_zone) | Name of the network zone e.g. eu-central, us-east, us-west. |
| <a name="output_subnet_type"></a> [subnet\_type](#output\_subnet\_type) | Type of subnet e.g. `server`, `cloud` or `vswitch`. |
| <a name="output_subnet_vswitch_id"></a> [subnet\_vswitch\_id](#output\_subnet\_vswitch\_id) | ID of the vswitch, Required if type is `vswitch` |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
