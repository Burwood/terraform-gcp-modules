output "network_name" {
  value       = "${google_compute_network.network.name}"
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value       = "${google_compute_network.network.self_link}"
  description = "The URI of the VPC being created"
}

output "network_id" {
  value = "${google_compute_network.network.id}"
}

output "network_subnetwork" {
  value = "${google_compute_subnetwork.subnetwork.*.name}"
}
output "network_subnetwork_noalias" {
  value = "${google_compute_subnetwork.subnetworknoalias.*.name}"
}

output "subnets_by_self_link_noalias" {
  value = "${data.google_compute_subnetwork.created_subnetsnoalias.*.self_link}"
}

output "subnets_by_self_link" {
  value = "${data.google_compute_subnetwork.created_subnets.*.self_link}"
}

output "subnets_by_name" {
  value =  "${data.google_compute_subnetwork.created_subnets.*.name}"
}

output "subnets_by_name_noalias" {
  value =  "${data.google_compute_subnetwork.created_subnetsnoalias.*.name}"
}

output "secondary_range_name" {
  value = ["${google_compute_subnetwork.subnetwork.*.secondary_ip_range}"]
}

output "secondary_range_name_noalias" {
  value = ["${google_compute_subnetwork.subnetworknoalias.*.secondary_ip_range}"]
}
