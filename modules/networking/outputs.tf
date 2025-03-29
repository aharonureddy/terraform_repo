# === Networking Module - outputs.tf ===
/*
output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.subnet.id
} */


output "vnet_id" {
  value = data.azurerm_virtual_network.existing_vnet.id
}

output "subnet_id" {
  value = data.azurerm_subnet.existing_subnet.id
}
