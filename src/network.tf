#--------------------------------
# Virtual Network
#--------------------------------

resource "azurerm_virtual_network" "core" {
  name                = module.naming.virtual_network.name
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name
  tags                = local.tags

  address_space = [var.virtual_network.address_space]
}

#--------------------------------
# Subnets
#--------------------------------

resource "azurerm_subnet" "paas" {
  name                              = "${module.naming.subnet.name}-paas"
  resource_group_name               = azurerm_resource_group.core.name
  virtual_network_name              = azurerm_virtual_network.core.name
  address_prefixes                  = [var.virtual_network.subnet_address_spaces.paas]
  private_endpoint_network_policies = "Enabled"
}

#--------------------------------
# Network Security Groups
#--------------------------------

resource "azurerm_network_security_group" "paas" {
  name                = "${module.naming.network_security_group.name}-paas"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name
  tags                = local.tags
}

resource "azurerm_subnet_network_security_group_association" "paas" {
  subnet_id                 = azurerm_subnet.paas.id
  network_security_group_id = azurerm_network_security_group.paas.id
}
