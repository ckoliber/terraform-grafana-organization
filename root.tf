resource "grafana_organization" "this" {
  count = var.id == null ? 1 : 0

  name                 = var.name
  admin_user           = var.admin
  admins               = var.admins
  editors              = var.editors
  viewers              = var.viewers
  users_without_access = var.members
}

locals {
  org_id = coalesce(var.id, grafana_organization.this[0].id)
}
