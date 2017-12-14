
output "attributes" {
  description = "Attribute string lowercase"
  value       = "${local.attr}"
}
output "environment" {
  description = "Environment name lowercase"
  value       = "${local.env}"
}
output "id" {
  description = "Full formatted name ID"
  #value       = "${null_resource.this.triggers.id}"
  value       = "${local.name_org}"
}
output "name" {
  description = "Name"
  value       = "${local.name_low}"
}
output "name_20" {
  description = "Name truncated to 20 characters"
  value       = "${local.name_20}"
}
output "name_32" {
  description = "Name truncated to 32 characters"
  value       = "${local.name_32}"
}
output "organization" {
  description = "Organization name lowercase"
  value       = "${local.org}"
}

/*
output "attributes" {
  description = "Attribute string lowercase"
  value       = "${null_resource.this.triggers.attributes}"
}
output "environment" {
  description = "Environment name lowercase"
  value       = "${null_resource.this.triggers.environment}"
}
output "id" {
  description = "Full formatted name ID"
  #value       = "${null_resource.this.triggers.id}"
  value       = "${local.name_org}=new"
}
output "name" {
  description = "Name"
  value       = "${null_resource.this.triggers.name}"
}
output "name_20" {
  description = "Name truncated to 20 characters"
  value       = "${null_resource.this.triggers.name_20}"
}
output "name_32" {
  description = "Name truncated to 32 characters"
  value       = "${null_resource.this.triggers.name_32}"
}
output "organization" {
  description = "Organization name lowercase"
  value       = "${null_resource.this.triggers.organization}"
}
*/
output "tags" {
  value = "${local.tags}"
}
