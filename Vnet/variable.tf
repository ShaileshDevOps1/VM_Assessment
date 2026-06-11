variable "vnets" {
  type = map(object({
    resource_group = string
    address_space  = list(string)
  }))
}

variable "resource_groups" {
  type = map(object({
    resource_group_name = string
    location = string
  }))
}