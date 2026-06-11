resource "azurerm_linux_virtual_machine" "vm" {

  name                = "spoke-vm"
  resource_group_name = "RG-SPOKE"

  location = "Central India"

  size = "Standard_D2s_v3"

  admin_username = "azureuser"

  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {

    username = "azureuser"

    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {

    caching = "ReadWrite"

    storage_account_type = "Premium_LRS"
  }

  source_image_reference {

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  
}