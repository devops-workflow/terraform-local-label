terraform-local-label
===

Terraform module to provide consistent label names and tags for resources.

A single name format will not solve every use case, so multiple variants are returned and there is a few options to affect how they get build. The general name convention is `{organization}-{environment}-{name}-{attributes}`. `Name` is required, the other 3 can be turned on/off indivisually. The delimiter (`-`) can be changed

All devops-workflow module will eventually use this.

*NOTE:* `local` refers to this using `locals` and does not create any resources. It just builds new variables.

Terraform registry: https://registry.terraform.io/modules/devops-workflow/label/local

TODO: Add usage/examples
