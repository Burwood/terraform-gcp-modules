
# Google Cloud Firewall Rule

This module will build a firewall rule to DENY Egress traffic

## Inputs

| Name                | Description                                                                                                                                                  | Type    | Default                                              | Required |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|------------------------------------------------------|----------|
| project_id          | The ID of the project in which the resource belongs.                                 | String  |          | yes   |
| name                | The name of the firewall rule to create.                                             | String  |          | yes   |
| direction           | Whether this is an Ingress or Egress rule.                                           | String  | INGRESS | no    |
| priority            | The number that helps derive the order in which to apply this rule                   | String  | 9000    | no    |
| network             | The name or self_link of the network to attach this firewall to                      | String  |          |  yes  |
| destination_ranges       | A list of destination CIDR ranges that this firewall applies to. Can't be used for INGRESS | List    | 0.0.0.0/0 | yes   |
| target_tags         | A list of target tags for this firewall                                              | List    |          | yes   |
| protocol            | The name of the protocol to allow. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, sctp), or the IP protocol number, or all"                         | String  |          | yes   |
| ports               | List of ports and/or port ranges to allow. This can only be specified if the protocol is TCP or UDP                                                                                                          | List    |          | yes   |
| enable_logging      | Whether or not to enable logging for this firewall rule. (This can incur cost)       | Boolean | false   | no    |

## Outputs

| Name                 | Description                     |
|----------------------|---------------------------------|
| firewall_self_link   | The URI of the created resource                           |
| firewall_target_tags | The network tags that will activate this firewall rule |
| firewall_ports       | The ports we are opening/closing                          |
