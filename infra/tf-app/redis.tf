resource "azurerm_redis_cache" "test_redis" {
  name                = "test-redis-yuan0037"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  capacity            = 1 # Basic tier
  family              = "P"
  sku_name            = "Premium"
  enable_non_ssl_port = false

  subnet_id = azurerm_subnet.test_subnet.id
}

resource "azurerm_redis_cache" "prod_redis" {
  name                = "prod-redis-yuan0037"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  capacity            = 1 # Standard tier
  family              = "P"
  sku_name            = "Premium"
  enable_non_ssl_port = false

  subnet_id = azurerm_subnet.prod_subnet.id
}
