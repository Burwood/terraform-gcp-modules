output "private_ip" {
  description = "list private ip on compute instance"
  value       = "${google_compute_instance.default.*.network_interface.0.network_ip}"
}

output "public_ip" {
  description = "list public ip on compute instance if there is one"
  value       = "${google_compute_instance.default.*.network_interface.0.access_config.0.nat_ip}"
}
/*
output "public_ssh_key" {
  description = "The public key we inserted"
  value       = ["${google_compute_instance.default.*.metadata}"]
}
*/