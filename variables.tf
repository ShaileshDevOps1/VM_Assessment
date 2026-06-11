variable "resource_groups" {
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}

variable "vnets" {
  type = map(object({
    resource_group = string
    address_space  = list(string)
  }))
}

variable "subnet" {
  type = map(object({
    vnet_name        = string
    resource_group   = string
    address_prefixes = list(string)
  }))
}
