#
# Terraform module to provide consistent naming
#

resource "null_resource" "pre1" {
  triggers  = {
    attributes    = "${lower(format("%s", join(var.delimiter, compact(var.attributes))))}"
    environment   = "${lower(format("%s", var.environment))}"
    name          = "${lower(format("%s", var.name))}"
    organization  = "${lower(format("%s", var.organization))}"
  }
}
resource "null_resource" "pre2" {
  triggers  = {
    name_env      = "${var.namespace-env ? join(var.delimiter, list(null_resource.pre1.triggers.environment, null_resource.pre1.triggers.name)) : null_resource.pre1.triggers.name}"
  }
}
resource "null_resource" "pre3" {
  triggers  = {
    name_org      = "${var.namespace-org ? join(var.delimiter, list(null_resource.pre1.triggers.organization, null_resource.pre2.triggers.name_env)) : null_resource.pre2.triggers.name_env}"
  }
}
resource "null_resource" "this" {
  count     = "${var.enabled ? 1 : 0}"
  triggers  = {
    attributes    = "${null_resource.pre1.triggers.attributes}"
    environment   = "${null_resource.pre1.triggers.environment}"
    organization  = "${null_resource.pre1.triggers.organization}"
    name          = "${null_resource.pre3.triggers.name_org}"
    name_20       = "${substr(replace(null_resource.pre3.triggers.name_org,"_","-"),0,19 <= length(null_resource.pre3.triggers.name_org) ? 19 : length(null_resource.pre3.triggers.name_org))}"
    name_32       = "${substr(replace(null_resource.pre3.triggers.name_org,"_","-"),0,31 <= length(null_resource.pre3.triggers.name_org) ? 31 : length(null_resource.pre3.triggers.name_org))}"
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
