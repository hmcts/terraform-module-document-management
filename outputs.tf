output "cognitive_account_identity" {
  value = azurerm_cognitive_account.cognitive_account.identity[0].principal_id
}

output "ai_services_identity" {
  value = azurerm_ai_services.ai_services.identity[0].principal_id
}

output "ai_foundry_identity" {
  value = azurerm_ai_foundry.ai_foundry.identity[0].principal_id
}

output "ml_workspace_identity" {
  value = azurerm_machine_learning_workspace.ml_workspace.identity[0].principal_id
}
