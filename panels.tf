resource "grafana_library_panel" "this" {
  for_each = var.panels

  org_id     = local.org_id
  name       = each.value.name
  model_json = each.value.json
  folder_uid = try(grafana_folder.this[each.value.folder].id, null)
}
