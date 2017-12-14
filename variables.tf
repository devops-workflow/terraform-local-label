// Standard Variables
variable "attributes" {
  description = "Suffix name with additional attributes (policy, role, etc.)"
  type        = "list"
  default     = []
}
variable "delimiter" {
  description = "Delimiter to be used between `name`, `namespaces`, `attributes`, etc."
  default     = "-"
}
variable "enabled" {
  description = "Enable use of module. Set to false to not create resources"
  default     = true
}
variable "environment" {
  description = "Environment (ex: dev, qa, stage, prod)"
}
variable "name" {
  description = "Name for the EFS Filesystem"
}
variable "namespace-env" {
  description = "Prefix name with the environment"
  default     = true
}
variable "namespace-org" {
  description = "Prefix name with the organization. If both env and org namespaces are used, format will be <org>-<env>-<name>"
  default     = false
}
variable "organization" {
  description = "Organization name"
  default     = ""
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
  default     = {}
}

// Internal Variables
variable "id" {
  default = ""
}
variable "name_lower" {
  description = "Internal"
  default     = ""
}
variable "name_env" {
  description = "Internal"
  default     = ""
}
variable "name_org" {
  description = "Internal"
  default     = ""
}
variable "nameo" {
  description = "Internal"
  default     = ""
}
