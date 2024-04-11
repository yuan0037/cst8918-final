resource "azurerm_redis_cache" "test_redis" {
  name                = "test-redis-cache"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  capacity            = 0 # Basic tier
  family              = "C"
  sku_name            = "Basic"
  enable_non_ssl_port = false

  subnet_id = azurerm_subnet.test_subnet.id
}

resource "azurerm_redis_cache" "prod_redis" {
  name                = "prod-redis-cache"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  capacity            = 1 # Standard tier
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false

  subnet_id = azurerm_subnet.prod_subnet.id
}
