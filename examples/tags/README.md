# Example with additional tags

## Attributes output

```Text
Outputs:

attributes = 8080
environment = dev
id = dev-capme-8080
id_20 = dev-capme-8080
id_32 = dev-capme-8080
id_attr_20 = dev-capme-8080
id_attr_32 = dev-capme-8080
id_env = dev-capme
id_org = dev-capme
name = capme
org_attr_20 = 9
org_attr_32 = 9
organization = corpxyz
tags = {
  Component = UNDEF
  Environment = dev
  Key = Value
  Monitor = UNDEF
  Name = dev-capme-8080
  Organization = corpxyz
  Owner = UNDEF
  Product = UNDEF
  Service = UNDEF
  Team = UNDEF
  Terraform = true
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Outputs

| Name | Description |
|------|-------------|
| attributes | Attribute string lowercase |
| environment | Environment name lowercase |
| id | Full combined ID |
| id_20 | ID truncated to 20 characters |
| id_32 | ID truncated to 32 characters |
| id_attr_20 | ID max size 20 characters by truncating `id_org` then appending `attributes` |
| id_attr_32 | ID max size 32 characters by truncating `id_org` then appending `attributes` |
| id_env | If env namespace enabled <env>-<name> else <name> |
| id_org | If org namespace enabled <org>-<id_env> else <id_env> |
| name | Name lowercase |
| org_attr_20 |  |
| org_attr_32 |  |
| organization | Organization name lowercase |
| tags | Tags with standard tags added |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

