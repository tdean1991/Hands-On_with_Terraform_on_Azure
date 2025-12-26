terraform {
  cloud {

    organization = "TestOrgTdean1991"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-41acc82b-hands-on-with-terraform-on-azure"
  location = "southcentralus"
}

module "securestorage" {
  source  = "app.terraform.io/TestOrgTdean1991/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "tdean1991-storage-account-terraform-test"
}