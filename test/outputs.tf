
output "attributes" {
  description = "Attribute string lowercase"
  value       = "${module.labels.attributes}"
}
output "environment" {
  description = "Environment name lowercase"
  value       = "${module.labels.environment}"
}
output "id" {
  value       = "${module.labels.id}"
}
output "name" {
  description = "Name"
  value       = "${module.labels.name}"
}
output "id_20" {
  description = "Name truncated to 20 characters"
  value       = "${module.labels.id_20}"
}
output "id_32" {
  description = "Name truncated to 32 characters"
  value       = "${module.labels.id_32}"
}
output "organization" {
  description = "Organization name lowercase"
  value       = "${module.labels.organization}"
}
output "tags" {
  description = "Tags"
  value       = "${module.labels.tags}"
}
