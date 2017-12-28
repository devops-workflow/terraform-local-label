# terraform-local-label

Terraform module to provide consistent label names and tags for resources.

A single name format will not solve every use case, so multiple variants are returned and there is a few options to affect how they get build. The general name convention is `{organization}-{environment}-{name}-{attributes}`. `Name` is required, the other 3 can be turned on/off individually. The delimiter (`-`) can be changed

All [devops-workflow](https://registry.terraform.io/search?q=devops-workflow&verified=false) modules will eventually use this.

**NOTE:** `local` refers to this using [locals](https://www.terraform.io/docs/configuration/locals.html) and does not create any resources. It just builds new variables.

Terraform registry: https://registry.terraform.io/modules/devops-workflow/label/local

## Usage:

#### Basic Example

```hcl
module "name" {
  source        = "devops-workflow/label/local"
  version       = "0.1.2"
  name          = "name"
  environment   = "qa"
}
```
This will create an `id` with the value of `qa-name`

#### S3 Example

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

#### All Variables Example
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
