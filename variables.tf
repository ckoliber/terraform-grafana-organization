variable "id" {
  type        = string
  default     = null
  sensitive   = false
  description = "Organization ID"
}

variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Organization Name"
}

variable "admin" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Organization Admin"
}

variable "admins" {
  type        = list(string)
  default     = []
  sensitive   = false
  description = "Organization Admins"
}

variable "editors" {
  type        = list(string)
  default     = []
  sensitive   = false
  description = "Organization Editors"
}

variable "viewers" {
  type        = list(string)
  default     = []
  sensitive   = false
  description = "Organization Viewers"
}

variable "members" {
  type        = list(string)
  default     = []
  sensitive   = false
  description = "Organization Members"
}

variable "teams" {
  type = map(object({
    name    = string
    email   = optional(string)
    members = optional(list(string), [])
  }))
  default     = {}
  sensitive   = false
  description = "Organization Teams"
}

variable "datasources" {
  type = map(object({
    name                = string
    type                = string
    url                 = optional(string)
    default             = optional(bool)
    access_mode         = optional(string)
    username            = optional(string)
    database_name       = optional(string)
    basic_auth_enabled  = optional(bool)
    basic_auth_username = optional(string)
    http_headers        = optional(string)
    json                = optional(string)
    secure_json         = optional(string)
    permissions         = optional(map(string), {})
  }))
  default     = {}
  sensitive   = false
  description = "Organization Datasources"
}

variable "folders" {
  type = map(object({
    title       = string
    permissions = optional(map(string), {})
  }))
  default     = {}
  sensitive   = false
  description = "Organization Folders"
}

variable "dashboards" {
  type = map(object({
    json        = string
    folder      = optional(string)
    permissions = optional(map(string), {})
  }))
  default     = {}
  sensitive   = false
  description = "Organization Dashboards"
}

variable "panels" {
  type = map(object({
    name   = string
    json   = string
    folder = optional(string)
  }))
  default     = {}
  sensitive   = false
  description = "Organization Panels"
}

variable "playlists" {
  type = map(object({
    name     = string
    interval = string
    items = optional(map(object({
      title = string
      order = string
      value = optional(string)
      type  = optional(string)
    })), {})
  }))
  default     = {}
  sensitive   = false
  description = "Organization Playlists"
}
