terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
  }

  required_version = "1.11.3"
}

provider "azurerm" {
  features {}
  subscription_id                 = var.subscription_id
  resource_provider_registrations = "core"
  resource_providers_to_register = [
    "Microsoft.Web",
  ]
}
