# === Compute Module - variables.tf ===

variable "resource_group_name" {
  description = "Existing resource group name"
  type        = string
}

variable "location" {
  description = "Location for resources"
  type        = string
}

variable "vm_list" {
  description = "List of VMs to create"
  type = map(object({
    vm_size         = string
    admin_username  = string
    admin_password  = string
    os_disk_size_gb = number
  }))
}

variable "subnet_id" {
  description = "The ID of the existing subnet"
  type        = string
}
