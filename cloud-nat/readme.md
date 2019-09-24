
# Google Cloud Nat Module

This terraform module will build a GCP Cloud NAT and Cloud Router if the nat.ip.allocate option is set to MANUAL, it will also allocate a public ip address

| Variable               | Description                                                                                                                                 |  Type  | Default      | Required |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|------------------------------------------------------------|----------|
| project_id                         | The ID of the project this resource will belong to                                                                                           | String  |                               | yes       |
| region                             | The region this NAT's router resides in                                                                                                      | String  |  us-central1                  | no       |
| network_self_link                  | The self_link of the network to NAT                                                                                                          | String  |                               | yes      |
| router_name                        | The name of the router in which this NAT will be configured. Changing this forces a new NAT to be created.                                   | String  | cloud-router                  | no       |
| nat_name                           | A unique name for Cloud NAT, required by GCE. Changing this forces a new NAT to be created.                                                  | String  | cloud-nat                     | no       |
| nat_ip_allocate_option             | How external IPs should be allocated for this NAT. Valid values are AUTO_ONLY or MANUAL_ONLY. Changing this forces a new NAT to be created.  | String  | AUTO_ONLY                     | no       |
| source_subnetwork_ip_ranges_to_nat | How NAT should be configured per Subnetwork. Valid values include: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS. Changing this forces a new NAT to be created.                                                                           | String  | ALL_SUBNETWORKS_ALL_IP_RANGES | no       |
| log_filter                         | Specifies the desired filtering of logs on this NAT. Valid values include: ALL, ERRORS_ONLY, TRANSLATIONS_ONLY                | String  | ALL                           | no       |
log_filter_enable                    | Whether or not to export logs                                                                                                                | Boolean | true                          | no       |
|nat_external_address_count      | Integer | 1                             | no       |

**Required here means whether or not the default is good enough to continue... Of course you have to give your router and NAT a name and a region to live in!
