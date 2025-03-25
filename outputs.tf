output "cognitive_account_identity" {
  value = azurerm_cognitive_account.cognitive_account.identity.principal_id
}

output "ai_foundry_identity" {
  value = azurerm_ai_foundry.ai_foundry.identity.principal_id
}

output "ml_workspace_identity" {
  value = azurerm_machine_learning_workspace.ml_workspace.identity.principal_id
}
