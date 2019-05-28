provider "google" {
  project = "${var.gcp_id}"
  region  = "${var.region["primary"]}"
  zone    = "${lookup(var.zone, var.region.["primary"])}"
  credentials = "${file(var.gcp_credential)}"
}

resource "google_compute_instance" "vm_instance" {
  name = "terransible-instance"
  machine_type = "${lookup(var.gci, var.region.["primary"])}"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "${google_compute_network.vpc_network.self_link}"
    access_config = {

    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terransible-network"
  auto_create_subnetworks = "true"
}