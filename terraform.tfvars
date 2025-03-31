resource_group_name = "rg-prod"
vnet_name           = "prod-vnet"
subnet_name         = "prod-subnet"
location            = "East US"

vm_list = {
  "vm3" = {
    admin_username  = "azureuser"
    admin_password  = "Password1234!"
    subnet_id   = "prod-subnet"
    vm_size     = "Standard_D2s_v3"
    os_disk_size_gb = 1
    tags = {
      environment = "production"
      project     = "example-project"
    }
  }
  "vm4" = {
    admin_username  = "azureuser"
    admin_password  = "Password1234!"
    subnet_id   = "prod-subnet"
    vm_size     = "Standard_D2s_v3"
    os_disk_size_gb = 1
    tags = {
      environment = "production"
      project     = "example-project"
    }
  }
}
