resource "grafana_data_source" "this" {
  for_each = var.datasources

  org_id                   = local.org_id
  name                     = each.value.name
  type                     = each.value.type
  url                      = each.value.url
  is_default               = each.value.default
  access_mode              = each.value.access_mode
  username                 = each.value.username
  database_name            = each.value.database_name
  basic_auth_enabled       = each.value.basic_auth_enabled
  basic_auth_username      = each.value.basic_auth_username
  http_headers             = each.value.http_headers
  json_data_encoded        = each.value.json
  secure_json_data_encoded = each.value.secure_json
}

resource "grafana_data_source_permission" "this" {
  for_each = var.datasources

  org_id         = local.org_id
  datasource_uid = grafana_data_source.this[each.key].uid

  dynamic "permissions" {
    for_each = each.value.permissions
    content {
      permission    = split(":", permissions.value)[2]
      built_in_role = startswith(permissions.value, "role:") ? split(":", permissions.value)[1] : null
      user_id       = startswith(permissions.value, "user:") ? split(":", permissions.value)[1] : null
      team_id       = startswith(permissions.value, "team:") ? grafana_team.this[split(":", permissions.value)[1]].team_id : null
    }
  }
}
