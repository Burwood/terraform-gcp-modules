variable "project_id" {
  description = "The ID of the project in which the resource belongs"
  type        = "string"
}

variable "name" {
  description = "Name of the Firewall rule"
  type        = "string"
}

variable "direction" {
  description = "Whether this is an Ingress or Egress rule."
  default     = "INGRESS"
}

variable "priority" {
  description = "The number that helps derive the order in which to apply this rule"
  default     = "1000"
}


variable "network" {
  description = "The name or self_link of the network to attach this firewall to"
  type        = "string"  
}

variable "source_ranges" {
  type        = "list"
  description = "A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS"
}

variable "target_tags" {
  type        = "list"
  description = "A list of target tags for this firewall"
}

variable "protocol" {
  description = "The name of the protocol to allow. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, sctp), or the IP protocol number, or all"
  type = "string"
}

variable "ports" {
  type        = "list"
  description = "List of ports and/or port ranges to allow. This can only be specified if the protocol is TCP or UDP"
}

variable "enable_logging" {
  description = "Whether or not to enable logging for this firewall rule. (This can get expensive)"
  default     = false
}