[![Slalom][logo]](https://slalom.com)

# terraform-gcp-cluster [![Build Status](https://api.travis-ci.com/JamesWoolfenden/terraform-gcp-cluster.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-gcp-cluster) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-bastion.svg)](https://github.com/JamesWoolfenden/terraform-gcp-cluster/releases/latest)

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
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| http\_load\_balancing\_disabled | Disable Http Load balancing | bool
 | `"false"` | no |
| ip\_allocation\_policy | Values to fill the cluster ip_allocation_policy block | map
 | n/a | yes |
| kubernetes\_dashboard\_disabled | Switch on the Dashboard | bool
 | `"false"` | no |
| location | The location of the cluster | string
 | n/a | yes |
| maintenance\_window |  | string
 | `"00:30"` | no |
| master\_authorized\_network\_cidr | The range of IPs that can connect to the Kubernetes master | string
 | n/a | yes |
| name | The Name of the cluster | string
 | n/a | yes |
| network | The name of the VPC | string
 | n/a | yes |
| network\_policy\_config\_disabled | Toggle network policy | bool
 | `"false"` | no |
| network\_project | The GCP project of the Network the cluster is in | string
 | n/a | yes |
| node\_pool | Configuration of the Node hosts | map
 | `{ "auto_repair": "true", "auto_upgrade": "true", "autoscaling_max": "10", "autoscaling_min": "1", "disk_size_gb": "10", "disk_type": "pd-standard", "machine_type": "n1-standard-2", "max_pods_per_node": "32", "name": "default-pool", "node_count": "1" }` | no |
| private\_cluster\_config | Values to fill the cluster private_cluster_config block | map
 | n/a | yes |
| region | The GCP region | string
 | n/a | yes |
| remove\_default\_node\_pool | An override to remove the node pool, doesnt make much sense to me either | bool
 | `"true"` | no |
| subnetwork | The name of the sub-net to use | string
 | n/a | yes |

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

Copyright � 2019-2019 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

  [![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

  [jameswoolfenden_homepage]: https://github.com/jameswoolfenden
  [jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150

[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-bastion&url=https://github.com/jameswoolfenden/terraform-aws-bastion
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-bastion&url=https://github.com/jameswoolfenden/terraform-aws-bastion
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-bastion
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-bastion
[share_email]: mailto:?subject=terraform-aws-bastion&body=https://github.com/jameswoolfenden/terraform-aws-bastion
