variable "network" {
  description = "The network this rule applies to."
  type        = "string"
  default     = "default"
}

variable "direction" {
  description = "Direction, ingress or egress."
  default     = "EGRESS"
}

variable "network" {
  description = "The self_link of the network to link the rules to."
  type        = "string"
  default     = ""
}

variable "project_id" {
  description = "The project to deploy to, if not set the default provider project is used."
  type        = "string"
  default     = ""
}

variable "ports" {
  description = "List of ports and/or ranges to allow."
  type        = "list"
  default     = []
}

variable "protocol" {
  description = "The name of the protocol to allow."
  type        = "string"
}

variable "direction" {
  description = "The direction of the traffic we are filtering"
  default     = "EGRESS"
}


variable "destination_ranges" {
  description = "A list of destination CIDR ranges that this firewall applies to. Can't be used for INGRESS."
  type        = "list"
  default     = ["0.0.0.0/0"]
}

variable "enable_logging" {
  description = " This field denotes whether to enable logging for a particular firewall rule."
  default     = "false"
}

variable "name" {
  description = "Firewall rule name."
  type        = "string"  
  default     = ""
}

variable "priority" {
  description = "Rule priority. Lower numbers are given more priority."
  type        = "string"
  default     = "1000"
}

variable "target_tags" {
  description = "Destination network tags. List of strings."
  type        = "list"
  default     = []
}
