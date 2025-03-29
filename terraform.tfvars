resource_group_name = "rg-prod"
vnet_name           = "prod-vnet"
subnet_name         = "prod-subnet"
location            = "East US"

vm_list = {
  "vm3" = {
    admin_user  = "azureuser"
    admin_pass  = "Password1234!"
    subnet_id   = data.azurerm_subnet.subnet.id
    vm_size     = "Standard_D2s_v3"
    tags = {
      environment = "production"
      project     = "example-project"
    }
  }
  "vm4" = {
    admin_user  = "azureuser"
    admin_pass  = "Password1234!"
    subnet_id   = data.azurerm_subnet.subnet.id
    vm_size     = "Standard_D2s_v3"
    tags = {
      environment = "production"
      project     = "example-project"
    }
  }
}
