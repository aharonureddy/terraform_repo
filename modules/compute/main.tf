# === Compute Module - main.tf ===

# Create Network Interfaces
resource "azurerm_network_interface" "nic" {
  for_each = var.vm_list

  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "production"
    vm_name     = each.key
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags
    ]
  }
}

# Create Virtual Machines
resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vm_list

  name                  = each.key
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = each.value.vm_size
  admin_username        = each.value.admin_username
  admin_password        = each.value.admin_password
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.nic[each.key].id]

  os_disk {
    name                 = "${each.key}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = each.value.os_disk_size_gb
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  tags = {
    environment = "production"
    vm_name     = each.key
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
      admin_password
    ]
  }
  
}