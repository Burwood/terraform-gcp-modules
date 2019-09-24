
# Google Cloud Compute Instance

This module will build a GCP Compute Instance and output its IP addresses

## Inputs

| Name                | Description                                                                                                                                                  | Type    | Default                                              | Required |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|------------------------------------------------------|----------|
| project             | The   ID   of   the   project   in   which   the   resource   belongs.                                                                                       | String  |                                                      |    yes   |
| region              | Region the project resides in.                                                                                                                               | String  | us-central1                                          |    no    |
| environment         | Select   envrironment   type   of   prod   or   dev   to   change   instance   types.   Prod  =  n1-standard-1 ,  dev  =  g1-small                           | String  | dev                                                  |    no    |
| machine_type_prod   | The Google Compute Engine Machine Type for the "prod" environment                                                                                            | String  | n1-standard-1                                        |    no    |
| machine_type_dev    | The Google Compute Engine Machine Type for the "dev" environment                                                                                             | String  | f1-micro                                             |    no    |
| count_compute       | The   total   number   of   instances   to   create.                                                                                                         | String  | 1                                                    |    no    |
| instance_name       | A   unique   name   for   the   resource ,  required   by   GCE.   Changing   this   forces   a   new   resource   to   be   created.                        | String  |                                                      |    yes   |
| image_name          | The   name   of   a   specific   image   or   a   family.                                                                                                    | String  | ubuntu-1804-lts                                      |    no    |
| compute_tags        | A   list   of   tags   to   attach   to   the   instance.                                                                                                    |  list   |                                                      |    no    |
| compute_labels      | A list of labels to attach to the instance                                                                                                                   |   Map   |                                                      |    no    |
| subnetwork_name     | Name   of   the   subnetwork   in   the   VPC.                                                                                                               | String  |                                                      |    yes   |
| size                | The   size   of   the   image   in   gigabytes.                                                                                                              | string  | 15                                                   |    no    |
| type                | The   GCE   disk   type.                                                                                                                                     | String  | pd-ssd                                               |    no    |
| auto_delete         | Whether   the   disk   will   be   auto-deleted   when   the   instance   is   deleted.   Defaults   to   true                                               | String  | true                                                 |    no    |
| scopes              | A   list   of   service   scopes.                                                                                                                            |  List   | [ "userinfo-email" ,  "compute-ro" ,  "storage-ro" ] |    no    |
| automatic_restart   | Specifies   if   the   instance   should   be   restarted   if   it   was   terminated   by   Compute   Engine  ( not   a   user ) .   Defaults   to   true. | String  | true                                                 |    no    |
| on_host_maintenance | Describes   maintenance   behavior   for   the   instance.   Can   be   MIGRATE   or   TERMINATE                                                             | String  | MIGRATE                                              |    no    |
| preemptible         | Whether or not to build a preemptible instance (PreEmptible instances live a max of 24hrs and can be reclaimed sooner)                                       | Boolean | false                                                |    no    |
| metadata_startup_script | The user-data script to run at first boot. (See Google Cloud Documentation for specifics)                                                                | String  |                                                      |    no    |
| metadata            | A map of key/value pairs of things like user-data and ssh-keys (See Google Cloud Documentation for specifics)                                                |   Map   |                                                      |    no    |

## Outputs

| Name       | Description                  |
|------------|------------------------------|
| private_ip | Instance private IP address. |
| public_ip  | Instance public IP address.  |
