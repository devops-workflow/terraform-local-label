#
# Terraform module to provide consistent naming
#
# TODO:
#   Add attributes to name if not empty
#   Refactor to use local and output the locals. Test - test - test
#   Change where replace is done. Move to earlier in process
#   Create tags_asg list from tags map. If possible
#   New input tags_asg -> tags_asg with standard tags added

module "namespace-env" {
  source  = "devops-workflow/boolean/local"
  version = "0.1.0"
  value   = "${var.namespace-env}"
}
module "namespace-org" {
  source  = "devops-workflow/boolean/local"
  version = "0.1.0"
  value   = "${var.namespace-org}"
}

locals {
  attr      = "${lower(format("%s", join(var.delimiter, compact(var.attributes))))}"
  env       = "${lower(format("%s", var.environment))}"
  name_low  = "${lower(format("%s", var.name))}"
  org       = "${lower(format("%s", var.organization))}"
  id_env    = "${module.namespace-env.value ? join(var.delimiter, list(local.env, local.name_low)) : local.name_low}"
  id_org    = "${module.namespace-org.value ? join(var.delimiter, list(local.org, local.id_env)) : local.id_env}"
  id        = "${length(local.attr) > 0 ? join(var.delimiter, list(local.id_org, local.attr)) : local.id_org}"
  id_20     = "${substr(replace(local.id,"_","-"),0,19 <= length(local.id) ? 19 : length(local.id))}"
  id_32     = "${substr(replace(local.id,"_","-"),0,31 <= length(local.id) ? 31 : length(local.id))}"
  /*
  id_attr_20= "${19 <= length(local.id) ?
    join(var.delimiter, substr(local.id_org,0,
    (19 <= length(local.id_org) ? 19 : length(local.id_org))
     - length(local.attr)
    ), local.attr)
    : local.id}"
  #id_attr_32= "${19 <= length(local.id) ? local.id : }"
  #id_attr_20 trunc name-org then join attr - total max still 20
  #id_attr_32 if id >32 trunc name-org to 31 - attr, then join attr
  */

  #tags_asg list of maps
  #map("key", "interpolation1", "value", "value3", "propagate_at_launch", true),
  # keys, values, map, merge, matchkeys, transpose

  #TODO: only add Organization if not ""
  tags      = "${ merge(
    var.tags,
    map(
      "Name", "${local.id}",
      "Environment", "${local.env}",
      "Organization", "${local.org}",
      "Terraform", "true"
    ))}"
}
