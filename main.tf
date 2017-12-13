#
# Terraform module to provide consistent naming
#

resource "null_resource" "this" {
  count     = "${var.enabled ? 1 : 0}"
  triggers  = {
    environment = "${lower(format("%s", var.environment))}"
    name        = "${var.namespaced ? lower(format("%s-%s", var.environment, var.name)) : lower(format("%s", var.name))}"
    /* FIX: wants only strings
    tags        = "${ merge(
      var.tags,
      map("Name", var.name),
      map("Environment", var.environment),
      map("Terraform", "true") )}"*/
  }
}
/*
resource "null_resource" "default" {
  count = "${var.enabled == "true" ? 1 : 0}"

  triggers = {
    id         = "${lower(join(var.delimiter, compact(concat(list(var.namespace, var.stage, var.name), var.attributes))))}"
    name       = "${lower(format("%v", var.name))}"
    namespace  = "${lower(format("%v", var.namespace))}"
    stage      = "${lower(format("%v", var.stage))}"
    attributes = "${lower(format("%v", join(var.delimiter, compact(var.attributes))))}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
*/
