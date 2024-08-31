resource "grafana_playlist" "this" {
  for_each = var.playlists

  org_id   = local.org_id
  name     = each.value.name
  interval = each.value.interval

  dynamic "item" {
    for_each = each.value.items
    content {
      title = item.value.title
      order = item.value.order
      value = item.value.value
      type  = item.value.type
    }
  }
}
