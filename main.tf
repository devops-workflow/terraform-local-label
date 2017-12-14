#
# Terraform module to provide consistent naming
#
# TODO:
#   Add attributes to name if not empty
#   Refactor to use local and output the locals. Test - test - test

locals {
  attr      = "${lower(format("%s", join(var.delimiter, compact(var.attributes))))}"
  env       = "${lower(format("%s", var.environment))}"
  name_low  = "${lower(format("%s", var.name))}"
  org       = "${lower(format("%s", var.organization))}"
  id_env    = "${var.namespace-env ? join(var.delimiter, list(local.env, local.name_low)) : local.name_low}"
  id_org    = "${var.namespace-org ? join(var.delimiter, list(local.org, local.id_env)) : local.id_env}"
  id        = "${length(local.attr) > 0 ? join(var.delimiter, list(local.id_org, local.attr)) : local.id_org}"
  id_20     = "${substr(replace(local.id,"_","-"),0,19 <= length(local.id) ? 19 : length(local.id))}"
  id_32     = "${substr(replace(local.id,"_","-"),0,31 <= length(local.id) ? 31 : length(local.id))}"
  tags      = "${ merge(
    var.tags,
    map(
      "Name", "${local.id}",
      "Environment", "${local.env}",
      "Organization", "${local.org}",
      "Terraform", "true"
    ))}"
}
