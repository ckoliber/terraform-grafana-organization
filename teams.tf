resource "grafana_team" "this" {
  for_each = var.teams

  org_id                           = local.org_id
  name                             = each.value.name
  email                            = each.value.email
  members                          = each.value.members
  ignore_externally_synced_members = true
}
