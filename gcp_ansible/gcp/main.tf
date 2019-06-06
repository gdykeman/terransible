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
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "${google_compute_network.vpc_network.self_link}"
    access_config = {

    }
  }

  labels {
    tag = "ansible"

  }

  metadata {
    image_os = "centos"
  }
}
resource "google_compute_network" "vpc_network" {
  name                    = "terransible-network"
  auto_create_subnetworks = "true"
}

terraform {
  backend "s3" {
    ##Partial Configuration##
  }
}