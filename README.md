
# terraform-gcp-cluster

A lightweight GKE cluster module, which

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| http\_load\_balancing |  | bool | `"false"` | no |
| ip\_allocation\_policy |  | map | n/a | yes |
| kubernetes\_dashboard |  | bool | `"false"` | no |
| location |  | string | n/a | yes |
| maintenance\_window |  | string | `"00:30"` | no |
| master\_authorized\_network\_cidr |  | string | n/a | yes |
| name |  | string | n/a | yes |
| network |  | string | n/a | yes |
| network\_policy\_config |  | bool | `"false"` | no |
| network\_project |  | string | n/a | yes |
| node\_pool |  | map | n/a | yes |
| project |  | string | n/a | yes |
| region |  | string | n/a | yes |
| remove\_default\_node\_pool |  | string | `"true"` | no |
| subnetwork |  | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
