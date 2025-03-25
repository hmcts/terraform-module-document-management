resource "azurerm_role_assignment" "blob_reader_from_cognitive_account" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_cognitive_account.cognitive_account.identity[0].principal_id
}

resource "azurerm_role_assignment" "blob_reader_from_ai_foundry" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_ai_foundry.ai_foundry.identity[0].principal_id
}

resource "azurerm_role_assignment" "blob_reader_from_ml_workspace" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azureml_machine_learning_workspace.ml_workspace.identity[0].principal_id
}