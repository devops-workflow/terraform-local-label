// Standard Variables

variable "name" {
  description = "Name for the EFS Filesystem"
}
variable "enabled" {
  description = "Enable use of module"
  default     = true
}
variable "environment" {
  description = "Environment (ex: dev, qa, stage, prod)"
}
variable "namespaced" {
  description = "Namespace all resources (prefixed with the environment)?"
  default     = true
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
  default     = {}
}

// Module specific Variables
