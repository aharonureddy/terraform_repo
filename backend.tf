# backend.tf

terraform {
  backend "azurerm" {
    resource_group_name  = "tf-backend-rg"
    storage_account_name = "tfbackendstorage0505"
    container_name       = "prod-tfstate"
    key                  = "prod.terraform.tfstate" # This will dynamically change with workspace
    # use_azuread_auth     = true
  }
}





/*
${terraform.workspace} will dynamically refer to the active workspace.

State files will be saved as:

- terraform.dev.tfstate

- terraform.staging.tfstate

- terraform.prod.tfstate
*/