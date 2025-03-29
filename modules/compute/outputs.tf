# === Compute Module - outputs.tf ===

output "vm_ids" {
  description = "IDs of the created VMs"
  value       = { for vm in azurerm_linux_virtual_machine.vm : vm.name => vm.id }
}

output "nic_ids" {
  description = "IDs of the created NICs"
  value       = { for nic in azurerm_network_interface.nic : nic.name => nic.id }
}