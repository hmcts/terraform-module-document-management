resource "azurerm_ai_services" "ai_services" {
  name                = "${local.name}-ai-services-${var.env}"
  location            = var.existing_resource_group_name == null ? azurerm_resource_group.rg[0].location : var.location
  resource_group_name = var.existing_resource_group_name == null ? azurerm_resource_group.rg[0].name : var.existing_resource_group_name
  sku_name            = "S0"

  tags = var.common_tags
}

resource "azurerm_ai_foundry" "ai_foundry" {
  name                = "${local.name}-ai-foundry-${var.env}"
  location            = azurerm_ai_services.ai_services.location
  resource_group_name = azurerm_ai_services.ai_services.location
  storage_account_id  = var.storage_account_id
  key_vault_id        = var.key_vault_id

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_machine_learning_workspace" "ml_workspace" {
  name                    = "${local.name}-ml-workspace-${var.env}"
  location                = azurerm_ai_services.ai_services.location
  resource_group_name     = azurerm_ai_services.ai_services.location
  application_insights_id = var.application_insights_id
  key_vault_id            = var.key_vault_id
  storage_account_id      = var.storage_account_id

  identity {
    type = "SystemAssigned"
  }
}