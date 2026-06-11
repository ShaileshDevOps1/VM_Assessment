locals {

  security_rules = {

    ssh = {
      priority = 100
      port     = 22
    }

    http = {
      priority = 110
      port     = 80
    }

    https = {
      priority = 120
      port     = 443
    }

    app = {
      priority = 130
      port     = 3000
    }
  }
}

resource "azurerm_network_security_group" "nsg" {

  name                = "spoke-nsg"
  location            = "Central India"
  resource_group_name = "RG-SPOKE"

}

resource "azurerm_network_security_rule" "rules" {

  for_each = local.security_rules

  name                        = each.key
  priority                    = each.value.priority
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = each.value.port

  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = "RG-SPOKE"
  network_security_group_name = azurerm_network_security_group.nsg.name
}