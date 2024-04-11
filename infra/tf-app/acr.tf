resource "azurerm_container_registry" "cr" {
  name                = "8918finalgroup6cr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}