terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.23.0"
    }
  }

}

# =======> Azure RBACs with Terraform Authentication <=======
#  Method :  authenticate Terraform with a specific user account that has Contributor access

provider "azurerm" {
  # Configuration options
  subscription_id = "b49cde9d-b065-418c-b0a4-8a85dc153a7b"
  features {}
}

