#
# Terraform module to provide consistent naming
#
# TODO:
#   Change where replace is done. Move to earlier in process. On initial `name`?
#   Create tags_asg list from tags map. If possible
#   New input tags_asg -> tags_asg with standard tags added
#

module "namespace-env" {
  source = "github.com/netflash/terraform-local-boolean"
  value  = var.namespace-env
}

module "namespace-org" {
  source = "github.com/netflash/terraform-local-boolean"
  value  = var.namespace-org
}

locals {
  attr        = lower(format("%s", join(var.delimiter, compact(var.attributes))))
  env         = lower(format("%s", var.environment))
  name_low    = replace(lower(format("%s", var.name)), "_", "-")
  org         = lower(format("%s", var.organization))
  id_env      = module.namespace-env.value == 1 ? join(var.delimiter, [local.env, local.name_low]) : local.name_low
  id_org      = module.namespace-org.value == 1 ? join(var.delimiter, [local.org, local.id_env]) : local.id_env
  id          = length(local.attr) > 0 ? join(var.delimiter, [local.id_org, local.attr]) : local.id_org
  id_20       = substr(local.id, 0, 19 <= length(local.id) ? 19 : length(local.id))
  id_32       = substr(local.id, 0, 31 <= length(local.id) ? 31 : length(local.id))
  org_attr_20 = min(18 - length(local.attr), length(local.id_org))
  org_attr_32 = min(30 - length(local.attr), length(local.id_org))

  id_attr_20 = 19 <= length(local.id) ? join(
    var.delimiter,
    [
      substr(
        local.id_org,
        0,
        local.org_attr_20 >= 0 ? local.org_attr_20 : 0,
      ),
    ],
    [local.attr],
  ) : local.id

  id_attr_32 = 31 <= length(local.id) ? join(
    var.delimiter,
    [
      substr(
        local.id_org,
        0,
        local.org_attr_32 >= 0 ? local.org_attr_32 : 0,
      ),
    ],
    [local.attr],
  ) : local.id

  #TODO: only add Organization if not ""
  tags = merge(
    var.tags,
    {
      "Component"    = var.component
      "Environment"  = local.env
      "Monitor"      = var.monitor
      "Name"         = local.id
      "Organization" = local.org
      "Owner"        = var.owner
      "Product"      = var.product
      "Service"      = var.service
      "Team"         = var.team
      "Terraform"    = "true"
    },
  )
}

