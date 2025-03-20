data "azurerm_subscription" "current" {
}

locals {
  default_name = var.component != "" ? "${var.product}-${var.component}" : var.product
  name         = var.name != "" ? var.name : local.default_name
}