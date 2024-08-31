output "id" {
  value       = local.org_id
  sensitive   = false
  description = "Organization ID"
}

output "teams" {
  value       = { for key, val in grafana_team.this : key => val.team_id }
  sensitive   = false
  description = "Organization Teams"
}

output "datasources" {
  value       = { for key, val in grafana_data_source.this : key => val.uid }
  sensitive   = false
  description = "Organization Datasources"
}

output "folders" {
  value       = { for key, val in grafana_folder.this : key => val.uid }
  sensitive   = false
  description = "Organization Folders"
}

output "dashboards" {
  value       = { for key, val in grafana_dashboard.this : key => val.uid }
  sensitive   = false
  description = "Organization Dashboards"
}

output "panels" {
  value       = { for key, val in grafana_library_panel.this : key => val.id }
  sensitive   = false
  description = "Organization Panels"
}

output "playlists" {
  value       = { for key, val in grafana_playlist.this : key => val.id }
  sensitive   = false
  description = "Organization Playlists"
}
