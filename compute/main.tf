###############################################################################################################
#
#         Get Google Compute Subnet and Zone Info for reuse
#
###############################################################################################################
data "google_compute_subnetwork" "subnetwork" {
  project = "${var.project}"
  region  = "${var.region}"
  name    = "${var.subnetwork_name}"
}

data "google_compute_zones" "available" {
  region  = "${var.region}"
  project = "${var.project}"
  status  = "UP"
}
###############################################################################################################
#
#         Create a Google Compute Instance
#

###############################################################################################################
######## Project Info
resource "google_compute_instance" "default" {
  count = "${var.count_compute}"

  name         = "${format("%s-%d", var.instance_name, count.index + var.count_start)}"
  machine_type = "${var.environment == "prod" ? var.machine_type_prod : var.machine_type_dev }"
  zone         = "${element(data.google_compute_zones.available.names, count.index)}"
  project      = "${var.project}"
  allow_stopping_for_update = true
  tags = ["${var.compute_tags}"]

  labels = "${var.compute_labels}"

  boot_disk {
    initialize_params {
      image = "${var.image_name}"
      size  = "${var.size}"
      type  = "${var.type}"
    }

    auto_delete = "${var.auto_delete ? 1 : 0}"
  }

  // Local SSD disk
  #scratch_disk {}

  network_interface {
    subnetwork = "${data.google_compute_subnetwork.subnetwork.self_link}"

    # Uncomment if public IP needed
    access_config {}
  }

  scheduling {
    preemptible         = "${var.preemptible ? 1:0}"
    automatic_restart   = "${var.automatic_restart ? 1 : 0}"
    on_host_maintenance = "${var.on_host_maintenance == "MIGRATE" ? "MIGRATE" : "TERMINATE"}"
  }

  service_account {
    scopes = ["${var.scopes}"]
  }

  # Startup Script. Uncomment if needed
  metadata_startup_script = "${var.metadata_startup_script}"
  
  # Instance Metadata like ssh-keys
  metadata = "${var.metadata}"

}
