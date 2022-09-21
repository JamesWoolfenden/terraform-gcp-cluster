# terraform-gcp-cluster

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-cluster/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-cluster)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-cluster.svg)](https://github.com/JamesWoolfenden/terraform-gcp-cluster/releases/latest)
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

## Costs

```text
Monthly cost estimate

Project: JamesWoolfenden/terraform-gcp-cluster/example/examplea

 Name                                                      Monthly Qty  Unit   Monthly Cost

 module.cluster.google_container_cluster.cluster
 └─ Cluster management fee                                         730  hours        $73.00

 module.cluster.google_container_node_pool.nodepool
 ├─ Instance usage (Linux/UNIX, on-demand, n1-standard-2)          730  hours        $48.54
 └─ Standard provisioned storage (pd-standard)                      10  GiB           $0.40

 OVERALL TOTAL                                                                      $121.94
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_container_cluster.cluster](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_cluster) | resource |
| [google_container_node_pool.nodepool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_RBAC_group_name"></a> [RBAC\_group\_name](#input\_RBAC\_group\_name) | n/a | `string` | `""` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | n/a | `bool` | `true` | no |
| <a name="input_http_load_balancing_disabled"></a> [http\_load\_balancing\_disabled](#input\_http\_load\_balancing\_disabled) | Disable Http Load balancing | `bool` | `false` | no |
| <a name="input_ip_allocation_policy"></a> [ip\_allocation\_policy](#input\_ip\_allocation\_policy) | Values to fill the cluster ip\_allocation\_policy block | `map(any)` | n/a | yes |
| <a name="input_kubernetes_dashboard_disabled"></a> [kubernetes\_dashboard\_disabled](#input\_kubernetes\_dashboard\_disabled) | Switch on the Dashboard | `bool` | `false` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | n/a | `string` | `"00:30"` | no |
| <a name="input_master_authorized_network_cidr"></a> [master\_authorized\_network\_cidr](#input\_master\_authorized\_network\_cidr) | The range of IPs that can connect to the Kubernetes master | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The Name of the cluster | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The VPC | `any` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | To enable the network policy | `bool` | `true` | no |
| <a name="input_network_policy_config_disabled"></a> [network\_policy\_config\_disabled](#input\_network\_policy\_config\_disabled) | Toggle network policy | `bool` | `false` | no |
| <a name="input_node_pool"></a> [node\_pool](#input\_node\_pool) | Configuration of the Node hosts | `map(any)` | <pre>{<br>  "auto_repair": "true",<br>  "auto_upgrade": "true",<br>  "autoscaling_max": "10",<br>  "autoscaling_min": "1",<br>  "disk_size_gb": "10",<br>  "disk_type": "pd-standard",<br>  "machine_type": "n1-standard-2",<br>  "max_pods_per_node": "32",<br>  "name": "default-pool",<br>  "node_count": "1"<br>}</pre> | no |
| <a name="input_pod_security_policy_config_enabled"></a> [pod\_security\_policy\_config\_enabled](#input\_pod\_security\_policy\_config\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_private_cluster_config"></a> [private\_cluster\_config](#input\_private\_cluster\_config) | Values to fill the cluster private\_cluster\_config block | `map(any)` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The GCP project of the Network the cluster is in | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The GCP region | `string` | n/a | yes |
| <a name="input_release_channel"></a> [release\_channel](#input\_release\_channel) | Set the release channel UNSPECIFIED\|RAPID\|REGULAR\|STABLE | `string` | `"STABLE"` | no |
| <a name="input_remove_default_node_pool"></a> [remove\_default\_node\_pool](#input\_remove\_default\_node\_pool) | An override to remove the node pool, doesnt make much sense to me either | `bool` | `true` | no |
| <a name="input_resource_labels"></a> [resource\_labels](#input\_resource\_labels) | n/a | `map(any)` | <pre>{<br>  "createdby": "terraform",<br>  "module": "terraform-gcp-cluster"<br>}</pre> | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The name of the sub-net to use | `any` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Role and Permissions

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang

resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "compute.instanceGroupManagers.get",
    "container.clusters.create",
    "container.clusters.delete",
    "container.clusters.get",
    "container.clusters.update",
    "container.operations.get",
    "iam.serviceAccounts.actAs"
  ]
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-cluster/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-cluster/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2022 James Woolfenden

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
