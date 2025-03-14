locals {
  tags = {
    project   = var.project
    stage     = var.stage
    location  = var.location
    managedBy = data.azurerm_client_config.current.object_id
  }
}

module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.2"
  suffix  = [var.project, var.stage]
}

#--------------------------------
# Resource Groups
#--------------------------------

resource "azurerm_resource_group" "core" {
  name     = module.naming.resource_group.name
  location = var.location
  tags     = local.tags
}
