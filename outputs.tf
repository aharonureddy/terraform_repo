# === outputs.tf ===


output "nic_ids" {
  description = "List of Network Interface IDs"
  value       = module.compute.nic_ids
}
