resource "azurerm_virtual_network" "vnets" {

  for_each = var.vnets

  name                = each.key
  location            = var.resource_groups[each.value.resource_group].location
  resource_group_name = each.value.resource_group

  address_space = each.value.address_space


}