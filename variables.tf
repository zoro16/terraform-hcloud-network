################################################
# Network
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network
################################################

variable "create_network" {
  description = "A boolean to check whether to create a network resource or not."
  type        = bool
  default     = false
}

variable "network_name" {
  description = "Name of the network to be created (must be unique per project)."
  type        = string
  default     = ""
}

variable "network_ip_cidr_range" {
  description = "IP CIDR Range of the whole Network which must span all included subnets and route destinations. Must be one of the private ipv4 ranges of RFC1918."
  type        = string
  default     = "10.0.0.0/8"
}

variable "network_labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type        = map(any)
  default     = {}
}

variable "network_delete_protection" {
  description = "Enable or disable delete protection."
  type        = bool
  default     = false
}

variable "network_expose_routes_to_vswitch" {
  description = "Enable or disable exposing the routes to the vSwitch connection. The exposing only takes effect if a vSwitch connection is active.."
  type        = bool
  default     = false
}

################################################
# Subnet
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_subnet
################################################

variable "create_subnet" {
  description = "A boolean to check whether to create a subent resource or not."
  type        = bool
  default     = false
}

variable "subnet_network_id" {
  description = "ID of the Network the subnet should be added to."
  type        = number
  default     = null
}

variable "subnet_type" {
  description = "Type of subnet e.g. `server`, `cloud` or `vswitch`."
  type        = string
  default     = ""

  validation {
    condition     = contains(["cloud", "server", "vswitch"], var.subnet_type) || var.subnet_type == ""
    error_message = "Subnet type must be one of these types `server`, `cloud` or `vswitch`."
  }
}

variable "subnet_ip_cidr_ranges" {
  description = "Range to allocate IPs from. Must be a subnet of the ip_range of the Network and must not overlap with any other subnets or with any destinations in routes."
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "subnet_network_zone" {
  description = "Name of the network zone e.g. eu-central, us-east, us-west."
  type        = string
  default     = ""

  validation {
    condition     = contains(["eu-central", "eu-east", "eu-west"], var.subnet_network_zone) || var.subnet_network_zone == ""
    error_message = "There are only 3 Network Zones ['eu-central', 'eu-east', 'eu-west'] are avaiable. Please enter a valid subnet_network_zone."
  }
}

variable "subnet_vswitch_id" {
  description = "ID of the vswitch, Required if type is `vswitch`"
  type        = number
  default     = null
}


################################################
# Network Route
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_route
################################################

variable "create_network_route" {
  description = "A boolean to check whether to create a Network Route resource or not."
  type        = bool
  default     = false
}

variable "network_route_network_id" {
  description = "ID of the Network the route should be added to."
  type        = number
  default     = null
}

variable "network_route_destination" {
  description = "Destination network or host of this route. Must be a subnet of the ip_range of the Network. Must not overlap with an existing ip_range in any subnets or with any destinations in other routes or with the first ip of the networks ip_range or with 172.31.1.1."
  type        = string
  default     = null

  validation {
    condition     = can(cidrhost(var.network_route_destination, 0)) && var.network_route_destination != "" || var.network_route_destination == null
    error_message = "`network_route_destination` cannot be set to empty string or invalide cidr."
  }
}

variable "network_route_gateway" {
  description = "Gateway for the route. Cannot be the first ip of the networks ip_range and also cannot be 172.31.1.1 as this IP is being used as a gateway for the public network interface of servers."
  type        = string
  default     = null

  validation {
    condition     = can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",var.network_route_gateway)) && var.network_route_gateway != "172.31.1.1" || var.network_route_gateway == null
    error_message = "Gateway cannot be `172.31.1.1` as this IP is being used as a gateway for the public network interface of servers."
  }
}

variable "network_routes" {
  description = "A map between route_destinations to route_gateways."
  type = map(any)
  default = {}
}
