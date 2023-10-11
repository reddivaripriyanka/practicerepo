

provider "azurerm" {
  tenant_id = "626b71f7-584d-4ef2-a2bb-9f65fc323b48"
  client_id = "b0452559-ae0d-4abe-9032-76880eec805f"
  client_secret = "B9H8Q~Xiw5~zcN9dQSI31VZ_K-pYs.JTgWXG5a5V"
  subscription_id = "5d64c3e3-bb53-43a1-81a2-adf2e7af7bbe"
  features {
  }
}
variable "resource_group_name" {
  type    = string
}

variable "location" {
  type    = string
}
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}
