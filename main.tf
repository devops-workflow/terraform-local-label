#
# Terraform module to provide consistent naming
#

local {
  name = "${var.namespaced ? format("%s-%s", var.environment, var.name) : format("%s", var.name)}"
  tags = "${ merge(
    var.tags,
    map("Name", var.name),
    map("Environment", var.environment),
    map("Terraform", "true") )}"
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
