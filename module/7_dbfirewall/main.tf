data "azurerm_mssql_server" "dataserver" {
  for_each = var.dbfirewall1map
    name                = each.value.sql_server_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_mssql_firewall_rule" "firewall_rule" {
   for_each = var.dbfirewall1map
  name                = each.key
  # resource_group_name = "${var.project_name}-${each.value.resource_group_name}-rg"
  # server_name         = data.azurerm_mssql_server.dataserver.name
  server_id = data.azurerm_mssql_server.dataserver[each.key].id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}