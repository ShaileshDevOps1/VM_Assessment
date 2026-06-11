variable "vnets" {
  type = map(object({
    resource_group = string
    address_space  = list(string)
  }))
}