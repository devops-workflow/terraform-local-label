variable "attributes" {
  description = "Suffix name with additional attributes (policy, role, etc.)"
  type        = "list"
  default     = []
}
variable "autoscaling_group" {
  description = "If true, generate ASG tags map resource"
  default     = false
}
variable "delimiter" {
  description = "Delimiter to be used between `name`, `namespaces`, `attributes`, etc."
  default     = "-"
}
variable "environment" {
  description = "Environment (ex: dev, qa, stage, prod)"
}
variable "name" {
  description = "Base name for resource"
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
