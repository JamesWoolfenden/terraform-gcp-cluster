# terraform-gcp-cluster

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-cluster/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-cluster)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-bastion.svg)](https://github.com/JamesWoolfenden/terraform-gcp-cluster/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

A lightweight GKE cluster module.

```terraform
module "cluster" {
  source                         = "JamesWoolfenden/cluster/gcp"
  ip_allocation_policy           = var.ip_allocation_policy
  location                       = var.location
  master_authorized_network_cidr = module.ip.cidr
  name                           = var.name
  network                        = var.network
  network_project                = var.network_project
  node_pool                      = var.node_pool
  private_cluster_config         = var.private_cluster_config
  region                         = var.region
  subnetwork                     = var.subnetwork
  network_policy_config_disabled = var.network_policy_config_disabled
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [google_container_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) |
| [google_container_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_repair | n/a | `bool` | `true` | no |
| auto\_upgrade | n/a | `bool` | `true` | no |
| http\_load\_balancing\_disabled | Disable Http Load balancing | `bool` | `false` | no |
| ip\_allocation\_policy | Values to fill the cluster ip\_allocation\_policy block | `map(any)` | n/a | yes |
| kubernetes\_dashboard\_disabled | Switch on the Dashboard | `bool` | `false` | no |
| maintenance\_window | n/a | `string` | `"00:30"` | no |
| master\_authorized\_network\_cidr | The range of IPs that can connect to the Kubernetes master | `string` | n/a | yes |
| name | The Name of the cluster | `string` | n/a | yes |
| network | The VPC | `any` | n/a | yes |
| network\_policy | To enable the network policy | `bool` | `true` | no |
| network\_policy\_config\_disabled | Toggle network policy | `bool` | `false` | no |
| node\_pool | Configuration of the Node hosts | `map(any)` | <pre>{<br>  "auto_repair": "true",<br>  "auto_upgrade": "true",<br>  "autoscaling_max": "10",<br>  "autoscaling_min": "1",<br>  "disk_size_gb": "10",<br>  "disk_type": "pd-standard",<br>  "machine_type": "n1-standard-2",<br>  "max_pods_per_node": "32",<br>  "name": "default-pool",<br>  "node_count": "1"<br>}</pre> | no |
| pod\_security\_policy\_config\_enabled | n/a | `bool` | `true` | no |
| private\_cluster\_config | Values to fill the cluster private\_cluster\_config block | `map(any)` | n/a | yes |
| project | The GCP project of the Network the cluster is in | `any` | n/a | yes |
| region | The GCP region | `string` | n/a | yes |
| release\_channel | Set the release channel UNSPECIFIED\|RAPID\|REGULAR\|STABLE | `string` | `"STABLE"` | no |
| remove\_default\_node\_pool | An override to remove the node pool, doesnt make much sense to me either | `bool` | `true` | no |
| resource\_labels | n/a | `map(any)` | <pre>{<br>  "createdby": "terraform",<br>  "module": "terraform-gcp-cluster"<br>}</pre> | no |
| subnetwork | The name of the sub-net to use | `any` | n/a | yes |
| zones | n/a | `any` | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-bastion/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-bastion/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2021 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-bastion&url=https://github.com/jameswoolfenden/terraform-aws-bastion
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-bastion&url=https://github.com/jameswoolfenden/terraform-aws-bastion
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-bastion
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-bastion
[share_email]: mailto:?subject=terraform-aws-bastion&body=https://github.com/jameswoolfenden/terraform-aws-bastion
