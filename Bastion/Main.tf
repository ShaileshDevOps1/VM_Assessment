resource "azurerm_bastion_host" "bastion" {

  name                = "hub-bastion"

  location            = "Central India"

  resource_group_name = "RG-HUB"

  ip_configuration {

    name = "configuration"

    subnet_id = azurerm_subnet.subnet["AzureBastionSubnet"].id

    public_ip_address_id = azurerm_public_ip.pip["bastion"].id
  }
}