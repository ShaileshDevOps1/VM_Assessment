module "resource_group" {

  source = "./Resource_group"

  resource_groups = var.resource_groups

}

module "vnet" {

  source = "./Vnet"

  vnets           = var.vnets
  resource_groups = var.resource_groups


  depends_on = [
    module.resource_group
  ]
}

module "subnet" {

  source = "./Subnet"

  subnets = var.subnets

  depends_on = [
    module.vnet
  ]
}

module "nsg" {

  source = "./NSG"



  depends_on = [
    module.resource_group
  ]
}

module "public_ip" {

  source = "./Public_Ip"



  depends_on = [
    module.resource_group
  ]
}

module "nic" {

  source = "./NIC"

  depends_on = [
    module.subnet,
    module.public_ip
  ]
}

module "vm" {

  source = "./VM"

  depends_on = [
    module.nic
  ]
}


module "bastion" {

  source = "./Bastion"

  depends_on = [
    module.subnet,
    module.public_ip
  ]
}

module "vnet_peering" {

  source = "./Vnet_peering"

  depends_on = [
    module.vnets
  ]
}