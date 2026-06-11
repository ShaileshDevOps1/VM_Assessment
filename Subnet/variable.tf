variable "subnets" {
  type = map(object({
    vnet_name         = string
    resource_group    = string
    address_prefixes  = list(string)
  }))
}