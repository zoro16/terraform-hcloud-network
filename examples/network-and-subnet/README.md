# network-and-subnet

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.47 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_net"></a> [net](#module\_net) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Hetzner Cloud API Token | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_delete_protection"></a> [network\_delete\_protection](#output\_network\_delete\_protection) | Enable or disable delete protection. |
| <a name="output_network_expose_routes_to_vswitch"></a> [network\_expose\_routes\_to\_vswitch](#output\_network\_expose\_routes\_to\_vswitch) | Enable or disable exposing the routes to the vSwitch connection. The exposing only takes effect if a vSwitch connection is active.. |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | Unique ID of the network. |
| <a name="output_network_ip_cidr_range"></a> [network\_ip\_cidr\_range](#output\_network\_ip\_cidr\_range) | IP CIDR Range of the whole Network which must span all included subnets and route destinations. Must be one of the private ipv4 ranges of RFC1918. |
| <a name="output_network_labels"></a> [network\_labels](#output\_network\_labels) | User-defined labels (key-value pairs) should be created with. |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Name of the network to be created (must be unique per project). |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID of the Network subnet. |
| <a name="output_subnet_ip_cidr_range"></a> [subnet\_ip\_cidr\_range](#output\_subnet\_ip\_cidr\_range) | Range to allocate IPs from. Must be a subnet of the ip\_range of the Network and must not overlap with any other subnets or with any destinations in routes. |
| <a name="output_subnet_network_id"></a> [subnet\_network\_id](#output\_subnet\_network\_id) | ID of the Network the subnet should be added to. |
| <a name="output_subnet_network_zone"></a> [subnet\_network\_zone](#output\_subnet\_network\_zone) | Name of the network zone e.g. eu-central, us-east, us-west. |
| <a name="output_subnet_type"></a> [subnet\_type](#output\_subnet\_type) | Type of subnet e.g. `server`, `cloud` or `vswitch`. |
| <a name="output_subnet_vswitch_id"></a> [subnet\_vswitch\_id](#output\_subnet\_vswitch\_id) | ID of the vswitch, Required if type is `vswitch` |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
