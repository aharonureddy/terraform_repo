# === Root Level - main.tf ===

data "azurerm_resource_group" "existing_rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "existing_vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "existing_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_network_interface" "existing_nic_vm1" {
  name                = "vm1-nic"
  resource_group_name = var.resource_group_name
}

data "azurerm_network_interface" "existing_nic_vm2" {
  name                = "vm2-nic"
  resource_group_name = var.resource_group_name
}


# Networking Module
module "networking" {
  source               = "./modules/networking"
  vnet_name            = var.vnet_name
  subnet_name          = var.subnet_name
  resource_group_name  = var.resource_group_name
  location             = var.location
}



# Compute Module
module "compute" {
  source               = "./modules/compute"
  vm_list              = var.vm_list
  resource_group_name  = var.resource_group_name
  location             = var.location
  subnet_id            = data.azurerm_subnet.existing_subnet.id
}