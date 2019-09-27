provider "azurerm" {
    version = "=1.33.1"
}

resource "azurerm_resource_group" "spark-rg" {
  name     = "${var.prefix}-rg"
  location = "${var.location}"
}

resource "azurerm_storage_account" "spark-storage" {
  name                     = "${replace(lower(var.prefix), "-", "")}storage"
  resource_group_name      = "${azurerm_resource_group.spark-rg.name}"
  location                 = "${azurerm_resource_group.spark-rg.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "spark-storage-container" {
  name                  = "${var.prefix}-container"
  resource_group_name   = "${azurerm_resource_group.spark-rg.name}"
  storage_account_name  = "${azurerm_storage_account.spark-storage.name}"
  container_access_type = "private"
}

resource "azurerm_hdinsight_spark_cluster" "spark-hdinsight" {
  name                = "${var.prefix}-hdi"
  resource_group_name = "${azurerm_resource_group.spark-rg.name}"
  location            = "${azurerm_resource_group.spark-rg.location}"
  cluster_version     = "4.0"
  tier                = "Standard"

  component_version {
    spark = "2.4"
  }

  gateway {
    enabled  = true
    username = "${var.hdi_admin_username}"
    password = "${var.hdi_admin_password}"
  }

  storage_account {
    storage_container_id = "${azurerm_storage_container.spark-storage-container.id}"
    storage_account_key  = "${azurerm_storage_account.spark-storage.primary_access_key}"
    is_default           = true
  }

  roles {
    head_node {
      vm_size  = "Standard_D12_v2"
      username = "${var.hdi_admin_username}"
      password = "${var.hdi_admin_password}"
    }

    worker_node {
      vm_size               = "Standard_D13_v2"
      username              = "${var.hdi_admin_username}"
      password              = "${var.hdi_admin_password}"
      target_instance_count = 2
    }

    zookeeper_node {
      vm_size  = "Medium"
      username = "${var.hdi_admin_username}"
      password = "${var.hdi_admin_password}"
    }
  }
}