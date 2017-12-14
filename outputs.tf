
output "attributes" {
  description = "Attribute string lowercase"
  value       = "${null_resource.this.triggers.attributes}"
}
output "environment" {
  description = "Environment name lowercase"
  value       = "${null_resource.this.triggers.environment}"
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
output "tags" {
  value = "${ merge(
    var.tags,
    map(
      "Name", "${null_resource.this.triggers.name}",
      "Environment", "${null_resource.this.triggers.environment}",
      "Organization", "${null_resource.this.triggers.organization}",
      "Terraform", "true"
    ))}"
}
