
variable "project" {
  description = "The ID of the project in which the resource belongs."
}

variable "region" {
  default = "us-central1"
}

variable "environment" {
  description = "Select envrironment type of prod or dev to change instance types. Prod = n1-standard-1, dev = g1-small"
  default     = "dev"
}

variable "machine_type_dev" {
  description = "(Required) The machine type to create for development."
  default     = "f1-micro"
}

variable "machine_type_prod" {
  description = "(Required) The machine type to create for production."
  default     = "n1-standard-1"
}

variable "count_compute" {
  description = "The total number of instances to create."
  default     = "1"
}

variable "count_start" {
  default = "1"
}

variable "image_name" {
  description = "(Required) The name of a specific image or a family."
  default     = "ubuntu-1804-lts"
}

# Compute Instance Variables
variable "instance_name" {
  description = "(Required) A unique name for the resource, required by GCE. Changing this forces a new resource to be created."

  #default = "instance"
}

variable "compute_tags" {
  description = "A list of tags to attach to the instance."
  type        = "list"
  default     = []
}
variable "compute_labels" {
  type    = "map"
  default = {}
}
# Network Interface Variables
variable "subnetwork_name" {
  type = "string"
  description = "Name of the subnetwork in the VPC."
}

# Boot-disk Variables
variable "size" {
  description = "The size of the image in gigabytes."
  default     = "15"
}

variable "type" {
  description = "The GCE disk type."
  default     = "pd-ssd"
}
variable "auto_delete" {
  description = "Whether the disk will be auto-deleted when the instance is deleted. Defaults to true"
  default     = "true"
}


# Service Account block
variable "scopes" {
  description = "(Required) A list of service scopes."
  type        = "list"
  default     = ["userinfo-email", "compute-ro", "storage-ro"]
}

# Scheduling
variable "automatic_restart" {
  description = "Specifies if the instance should be restarted if it was terminated by Compute Engine (not a user). Defaults to true."
  default     = "true"
}

variable "on_host_maintenance" {
  description = "(Optional) Describes maintenance behavior for the instance. Can be MIGRATE or TERMINATE"
  default     = "MIGRATE"
}

variable "preemptible" {
  description = "Whether or not this is a preemptible VM"
  default     = false
}

variable "metadata_startup_script" {
    description = "The user-data script to run at first boot"
    type = "string"
    default = ""
}

variable "metadata" {
  description = "A map of key/value pairs of things like user-data and ssh-keys"
  type = "map"
  default = {}
}
