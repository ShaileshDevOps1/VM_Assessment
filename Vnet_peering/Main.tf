resource "azurerm_virtual_network_peering" "hub_to_spoke" {

  name = "hub-to-spoke"

  resource_group_name = "RG-HUB"

  virtual_network_name = "hub-vnet"

  remote_virtual_network_id = azurerm_virtual_network.vnets["spoke-vnet"].id
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {

  name = "spoke-to-hub"

  resource_group_name = "RG-SPOKE"

  virtual_network_name = "spoke-vnet"

  remote_virtual_network_id = azurerm_virtual_network.vnets["hub-vnet"].id
}