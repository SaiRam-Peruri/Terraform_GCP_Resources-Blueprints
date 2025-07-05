// GCP Compute VM Instance - modular and production-grade

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    network    = var.network_id
    subnetwork = var.subnet_id
    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    startup-script = "#!/bin/bash\necho 'Hello World' > /tmp/hello.txt"
  }

  tags = ["http-server", "https-server"]
}

output "vm_instance_id" {
  description = "The ID of the created VM instance."
  value       = google_compute_instance.vm_instance.id
}

output "vm_internal_ip" {
  description = "The internal IP address of the VM instance."
  value       = google_compute_instance.vm_instance.network_interface[0].network_ip
}

output "vm_external_ip" {
  description = "The external IP address of the VM instance."
  value       = length(google_compute_instance.vm_instance.network_interface[0].access_config) > 0 ? google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip : null
}
