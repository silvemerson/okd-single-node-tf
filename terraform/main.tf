provider "google" {
  project = var.project_id
  region  = var.region
  # credentials = file("/tmp/gcp-credentials.json")
}

resource "google_compute_instance" "okd_single_node" {
  name         = "okd-single-node"
  machine_type = "e2-standard-4" 
  zone         = var.zone
  

  boot_disk {
    initialize_params {
      image = "projects/centos-cloud/global/images/centos-stream-9-v20230912" 
      size  = 100
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.okd_static_ip.address
    }
  }

  metadata = {
    ssh-keys = "okd-user:${file("ssh-keypair/okd-user-rsa.pub")}" 
  }

  tags = ["okd", "single-node"]

  provisioner "local-exec" {
    command = "echo ${google_compute_instance.okd_single_node.network_interface[0].access_config[0].nat_ip} > instance_ip.txt"
  }
}

resource "google_compute_address" "okd_static_ip" {
  name   = "okd-static-ip"
  region = var.region
}
