# terraform-local-label

[![CircleCI](https://circleci.com/gh/devops-workflow/terraform-local-label.svg?style=svg)](https://circleci.com/gh/devops-workflow/terraform-local-label)

Terraform module to provide consistent label names and tags for resources.

A single name format will not solve every use case, so multiple variants are
returned and there is a few options to affect how they get build. The general
name convention is `{organization}-{environment}-{name}-{attributes}`.
`Name` is required, the other 3 can be turned on/off individually.
The delimiter (`-`) can be changed

All [devops-workflow](https://registry.terraform.io/modules/devops-workflow)
modules will eventually use this or [labels](https://registry.terraform.io/modules/devops-workflow/labels/null).

**NOTE:** `local` refers to this using
[locals](https://www.terraform.io/docs/configuration/locals.html) and does not
create any resources. It just builds new variables.

[Terraform registry](https://registry.terraform.io/modules/devops-workflow/label/local)

## Usage

### Basic Example

```hcl
module "name" {
  source        = "devops-workflow/label/local"
  version       = "0.1.2"
  name          = "name"
  environment   = "qa"
}
```

This will create an `id` with the value of `qa-name`

### S3 Example

```hcl
module "s3-name" {
  source        = "devops-workflow/label/local"
  version       = "0.1.2"
  name          = "data"
  environment   = "qa"
  organization  = "corp"
  namespace-org = "true"
}
```

This will create an `id` with the value of `corp-qa-data`

Now reference `label` outputs to create the S3 bucket

```hcl
resource "aws_s3_bucket" "data" {
  bucket  = "${module.s3-name.id}"
  tags    = "${module.s3-name.tags}"
}
```

### All Variables Example

Using in a module and exposing all settings to upstream caller.

```hcl
module "label" {
  source        = "devops-workflow/label/local"
  version       = "0.1.2"
  organization  = "${var.organization}"
  name          = "${var.name}"
  namespace-env = "${var.namespace-env}"
  namespace-org = "${var.namespace-org}"
  environment   = "${var.environment}"
  delimiter     = "${var.delimiter}"
  attributes    = "${var.attributes}"
  tags          = "${var.tags}"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Suffix name with additional attributes (policy, role, etc.) | list | `<list>` | no |
| component | TAG: Underlying, dedicated piece of service (Cache, DB, ...) | string | `UNDEF` | no |
| delimiter | Delimiter to be used between `name`, `namespaces`, `attributes`, etc. | string | `-` | no |
| environment | Environment (ex: `dev`, `qa`, `stage`, `prod`). (Second or top level namespace. Depending on namespacing options) | string | - | yes |
| monitor | TAG: Should resource be monitored | string | `UNDEF` | no |
| name | Base name for resource | string | - | yes |
| namespace-env | Prefix name with the environment. If true, format is: <env>-<name> | string | `true` | no |
| namespace-org | Prefix name with the organization. If true, format is: <org>-<env namespaced name>. If both env and org namespaces are used, format will be <org>-<env>-<name> | string | `false` | no |
| organization | Organization name (Top level namespace) | string | `` | no |
| owner | TAG: Owner of the service | string | `UNDEF` | no |
| product | TAG: Company/business product | string | `UNDEF` | no |
| service | TAG: Application (microservice) name | string | `UNDEF` | no |
| tags | A map of additional tags | map | `<map>` | no |
| team | TAG: Department/team of people responsible for service | string | `UNDEF` | no |

## Outputs

| Name | Description |
|------|-------------|
| attributes | Attribute string lowercase |
| environment | Environment name lowercase |
| id | Fully formatted name ID |
| id_20 | ID truncated to 20 characters |
| id_32 | ID truncated to 32 characters |
| id_attr_20 | ID max size 20 characters by truncating `id_org` then appending `attributes` |
| id_attr_32 | ID max size 32 characters by truncating `id_org` then appending `attributes` |
| id_env | If env namespace enabled <env>-<name> else <name> |
| id_org | If org namespace enabled <org>-<id_env> else <id_env> |
| name | Name lowercase |
| org_attr_20 | debugging |
| org_attr_32 | Internal debugging. DO NOT USE |
| organization | Organization name lowercase |
| tags | Tags map merged with standard tags |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
