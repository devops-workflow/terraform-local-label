
output "attributes" {
  description = "Attribute string lowercase"
  value       = "${module.labels.attributes}"
}
output "environment" {
  description = "Environment name lowercase"
  value       = "${module.labels.environment}"
}
output "id" {
  description = "Full combined ID"
  value       = "${module.labels.id}"
}
output "name" {
  description = "Name lowercase"
  value       = "${module.labels.name}"
}
output "id_20" {
  description = "ID truncated to 20 characters"
  value       = "${module.labels.id_20}"
}
output "id_32" {
  description = "ID truncated to 32 characters"
  value       = "${module.labels.id_32}"
}
output "id_attr_20" {
  description = "ID max size 20 characters by truncating `id_org` then appending `attributes`"
  value       = "${module.labels.id_attr_20}"
}
output "id_attr_32" {
  description = "ID max size 32 characters by truncating `id_org` then appending `attributes`"
  value       = "${module.labels.id_attr_32}"
}
output "id_env" {
  description = "If env namespace enabled <env>-<name> else <name>"
  value       = "${module.labels.id_env}"
}
output "id_org" {
  description = "If org namespace enabled <org>-<id_env> else <id_env>"
  value       = "${module.labels.id_org}"
}
output "organization" {
  description = "Organization name lowercase"
  value       = "${module.labels.organization}"
}
output "tags" {
  description = "Tags with standard tags added"
  value       = "${module.labels.tags}"
}
output "org_attr_20" {
  value = "${module.labels.org_attr_20}"
}
output "org_attr_32" {
  value = "${module.labels.org_attr_32}"
}
