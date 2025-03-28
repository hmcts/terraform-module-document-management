resource "azurerm_ai_foundry" "ai_foundry" {
  name                = "${var.product}-ai-foundry-${var.env}"
  location            = var.existing_resource_group_name == null ? azurerm_resource_group.rg[0].location : var.location
  resource_group_name = var.existing_resource_group_name == null ? azurerm_resource_group.rg[0].name : var.existing_resource_group_name
  storage_account_id  = var.storage_account_id
  key_vault_id        = var.key_vault_id

  identity {
    type = "SystemAssigned"
  }

  managed_network {
    isolation_mode = "AllowInternetOutbound"
  }

  tags = var.common_tags
}

resource "azurerm_cognitive_account" "cognitive_account" {
  name                = "${var.product}-cognitive-account-${var.env}"
  location            = var.existing_resource_group_name == null ? azurerm_resource_group.rg[0].location : var.location
  resource_group_name = var.existing_resource_group_name == null ? azurerm_resource_group.rg[0].name : var.existing_resource_group_name
  kind                = var.cognitive_account_kind

  sku_name = var.cognitive_account_sku

  identity {
    type = "SystemAssigned"
  }

  tags = var.common_tags

}

resource "azurerm_machine_learning_workspace" "ml_workspace" {
  name                    = "${var.product}-ml-workspace-${var.env}"
  location                = var.existing_resource_group_name == null ? azurerm_resource_group.rg[0].location : var.location
  resource_group_name     = var.existing_resource_group_name == null ? azurerm_resource_group.rg[0].name : var.existing_resource_group_name
  application_insights_id = var.application_insights_id
  key_vault_id            = var.key_vault_id
  storage_account_id      = var.storage_account_id

  identity {
    type = "SystemAssigned"
  }

  managed_network {
    isolation_mode = "AllowInternetOutbound"
  }

  tags = var.common_tags
}