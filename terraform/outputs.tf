output "azure_storage_name" {
  value = "${azurerm_storage_account.spark-storage.name}"
}

output "azure_storage_primary_connection_string" {
  value = "${azurerm_storage_account.spark-storage.primary_connection_string}"
}
