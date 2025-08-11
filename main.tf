terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"

    }
  }
  cloud {

    organization = "AWS_Learning_git"

    workspaces {
      name = "handsonlap"
    }
  }
}
provider "azurerm" {
skip_provider_registration = true
  features {}
}
resource "azurerm_resource_group" "RG" {
  name     = "813-a8856c5a-hands-on-with-terraform-on-azure"
  location = "South Central US"

}
module "storage" {
  source               = "app.terraform.io/AWS_Learning_git/storage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.RG.location
  resource_group_name  = azurerm_resource_group.RG.name
  storage_account_name = "saangela35674567"

}
