resource "azurerm_network_interface" "nic" {

  name                = "spoke-vm-nic"
  location            = "Central India"
  resource_group_name = "RG-SPOKE"

  ip_configuration {

    name                          = "ipconfig1"

    subnet_id = data.azurerm_subnet.frontend.id

    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.pip["vm"].id
  }
}