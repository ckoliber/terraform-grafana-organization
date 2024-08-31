resource "grafana_dashboard" "this" {
  for_each = var.dashboards

  org_id      = local.org_id
  config_json = each.value.json
  folder      = try(grafana_folder.this[each.value.folder].id, null)
  overwrite   = true
}

resource "grafana_dashboard_permission" "this" {
  for_each = var.dashboards

  org_id        = local.org_id
  dashboard_uid = grafana_dashboard.this[each.key].uid

  dynamic "permissions" {
    for_each = each.value.permissions
    content {
      permission = split(":", permissions.value)[2]
      role       = startswith(permissions.value, "role:") ? split(":", permissions.value)[1] : null
      user_id    = startswith(permissions.value, "user:") ? split(":", permissions.value)[1] : null
      team_id    = startswith(permissions.value, "team:") ? grafana_team.this[split(":", permissions.value)[1]].team_id : null
    }
  }
}
