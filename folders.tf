resource "grafana_folder" "this" {
  for_each = var.folders

  org_id                       = local.org_id
  title                        = each.value.title
  prevent_destroy_if_not_empty = true
}

resource "grafana_folder_permission" "this" {
  for_each = var.folders

  org_id     = local.org_id
  folder_uid = grafana_folder.this[each.key].uid

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
