# Complete VPC Example

Configuration in this directory creates a VPC in the project defined.

## Usage

To run this example you need to execute

```terraform
$ terraform init
$ terraform plan
$ terraform apply
```

Run terraform destroy when you don't need these resources.

## Inputs

| Name               | Description                                                                      | Type   | Default     | Required |
|--------------------|----------------------------------------------------------------------------------|--------|-------------|----------|
| credential_file | Location of the credential file | String | -  | yes |
| project_id | The ID of the project in which the resources we are building belong | String | - | yes |
| network_name | The name of the VPC network in the defined project | String | -  | yes  |
| auto_create_subnetworks | Whether or not to let GCP auto create the default subnets for all regions in the VPC (**If set to true this will deactivate the below options**) | Boolean | true | yes |
| routing_mode | The network routing mode | string | GLOBAL | no |
| delete_default_routes | Whether or not to delete the default routes in the new subnets (think private subnet) | Boolean | true | no |
| subnet_flow_logs | Whether or not to enable flow logs on the subnet | Boolean | false | no |
| create_vpc_secondary_ranges | Whether or not to create secondary ranges for vpc subnets (alias IPs) | Boolean | false | no |
| routes | List of routes being created in this VPC | List | - | no |
| subnets | A list of maps containing the info needed to build the subnets if auto_create_subnetworks is set to false(see below)| List | - | no |
| secondary_ranges | A map of maps containing the info needed to build the Alias IP Subnets if create_vpc_secondary_ranges is set to to true(see below)| List | - | no |

Subnets is a list of maps in the form:

```terraform
subnets = [
    {
      subnet_name         = "public-subnet_name"
      subnet_ip           = "public-subnet_ip"
      subnet_region       = "gcp_region"
      subnet_flow_logs    = true
      subnet_private_access = true
    },
    {
      subnet_name         = "private-subnet_name"
      subnet_ip           = "private-subnet_ip"
      subnet_region       = "gcp_region"
      subnet_flow_logs    = true
      subnet_private_access = true
    }
  ]
```

Secondary Ranges is a map of maps in the form:

```terraform
  secondary_ranges = {
    "private-subnet_name" = [
      {
        range_name    = "private-subnet_secondary_name1"
        ip_cidr_range = "x.x.x.x/Y}"
      },
    ],
    "public-subnet_name" = [
      {
        range_name    = "public-subnet_secondary_name2"
        ip_cidr_range = "x.x.x.x/Y}"
      },
    ],
  }
```

## Outputs

| Name                | Description                                                                                                   |
|---------------------|---------------------------------------------------------------------------------------------------------------|
| peer1_state_details | Outputs the data and time of the VPC peer was created and if the the peer is connected from the commons side. |
| peer1_vpc_state     | Outputs that state of the peer on the commons side. Will display as either ACTIVE or INACTIVE.                |
| peer2_state_details | Outputs the data and time of the VPC peer was created and if the the peer is connected from the csoc side.    |
| peer2_vpc_state     | Outputs that state of the peer on the csoc side. Will display as either ACTIVE or INACTIVE.                   |