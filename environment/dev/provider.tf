terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.5.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "c307b481-c818-4151-a2d1-bcf953bc4c8d"
}