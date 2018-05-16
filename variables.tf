variable "attributes" {
  description = "Suffix name with additional attributes (policy, role, etc.)"
  type        = "list"
  default     = []
}

variable "autoscaling_group" {
  description = "DOES NOTHING YET. If true, generate ASG tags map resource"
  default     = false
}

variable "component" {
  description = "TAG: Underlying, dedicated piece of service (Cache, DB, ...)"
  default     = "UNDEF"
}

variable "delimiter" {
  description = "Delimiter to be used between `name`, `namespaces`, `attributes`, etc."
  default     = "-"
}

variable "environment" {
  description = "Environment (ex: `dev`, `qa`, `stage`, `prod`). (Second or top level namespace. Depending on namespacing options)"
}

variable "monitor" {
  description = "TAG: Should resource be monitored"
  default     = "UNDEF"
}

variable "name" {
  description = "Base name for resource"
}

variable "namespace-env" {
  description = "Prefix name with the environment. If true, format is: <env>-<name>"
  default     = true
}

variable "namespace-org" {
  description = "Prefix name with the organization. If true, format is: <org>-<env namespaced name>. If both env and org namespaces are used, format will be <org>-<env>-<name>"
  default     = false
}

variable "organization" {
  description = "Organization name (Top level namespace)"
  default     = ""
}

variable "owner" {
  description = "TAG: Owner of the service"
  default     = "UNDEF"
}

variable "product" {
  description = "TAG: Company/business product"
  default     = "UNDEF"
}

variable "service" {
  description = "TAG: Application (microservice) name"
  default     = "UNDEF"
}

variable "tags" {
  description = "A map of additional tags"
  type        = "map"
  default     = {}
}

variable "team" {
  description = "TAG: Department/team of people responsible for service"
  default     = "UNDEF"
}
