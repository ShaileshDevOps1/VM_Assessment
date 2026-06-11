locals {

  public_ips = {
    vm      = {}
    bastion = {}
  }
}

resource "azurerm_public_ip" "pip" {

  for_each = local.public_ips

  name                = "${each.key}-pip"
  location            = "Central India"
  resource_group_name = "RG-SPOKE"

  allocation_method = "Static"

  sku = "Standard"
}