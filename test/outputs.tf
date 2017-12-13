
output "environment" {
  description = "Environment name"
  value       = "${module.labels.environment}"
}
output "name" {
  description = "Name"
  value       = "${module.labels.name}"
}
/*
output "tags" {
  description = "Tags"
  value       = "${module.labels.tags}"
}
*/
