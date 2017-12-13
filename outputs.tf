
output "environment" {
  description = "Environment name"
  value       = "${null_resource.this.triggers.environment}"
}
output "name" {
  description = "Name"
  value       = "${null_resource.this.triggers.name}"
}
/*
output "tags" {
  description = "Tags"
  value       = "${null_resource.this.triggers.tags}"
}
*/
