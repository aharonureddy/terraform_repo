# === variables.tf ===

variable "resource_group_name" {
  description = "Name of the existing resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "vnet_name" {
  description = "Name of the existing virtual network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the existing subnet"
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