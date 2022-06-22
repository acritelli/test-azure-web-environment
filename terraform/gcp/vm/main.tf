terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~>3.87"
        }
    }
}

provider "google" {
    credentials = var.credentials_json
    project = var.project
    zone = var.zone

}

resource "random_id" "suffix" {
    byte_length = 4
}

resource "google_compute_instance" "vm" {
    name         = "${var.prefix}-vm-${random_id.suffix.hex}"
    machine_type = var.instance_type

    metadata = {
        ssh-keys = "${var.admin_user}:${var.admin_key_public}"
    }

    boot_disk {
        initialize_params {
            image = "${var.image.project}/${var.image.family}"
        }
    }

    network_interface {
        network = var.network_name
        access_config {}
    }
}
