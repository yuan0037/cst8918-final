provider "kubernetes" {
  config_context_cluster = azurerm_kubernetes_cluster.test_cluster.kube_config[0].name
  alias                  = "test"
}

resource "azurerm_kubernetes_cluster" "test_cluster" {
  name                = "8918-test-cluster-group06"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "8919-group6-test-cluster"

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.6.0.0/24" // Specify the Service CIDR range
    dns_service_ip = "10.6.0.10"   // IP address within the service_cidr range
    network_policy = "azure"
  }

  default_node_pool {
    name           = "default"
    node_count     = 1
    vm_size        = "Standard_B2s"
    vnet_subnet_id = azurerm_subnet.test_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = "1.26.10"
}


resource "kubernetes_secret" "test_secret" {
  provider = kubernetes.test
  metadata {
    name = "my-secret-aks-test"
  }
  data = {
    "REDIS_HOST" = azurerm_redis_cache.test_cluster.host
    "REDIS_KEY"  = azurerm_redis_cache.test_cluster.primary_access_key
  }
  depends_on = [azurerm_kubernetes_cluster.test_cluster, azurerm_redis_cache.test_redis]
}

