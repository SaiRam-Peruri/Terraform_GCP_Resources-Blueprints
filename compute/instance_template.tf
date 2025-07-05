// GCP Instance Template - modular and production-grade

resource "google_compute_instance_template" "template" {
  count        = var.template_name != null ? 1 : 0
  name         = var.template_name
  project      = var.project_id
  machine_type = var.machine_type

  disk {
    source_image = var.boot_image
    auto_delete  = true
    boot         = true
    disk_type    = var.disk_type
    disk_size_gb = var.size_gb
  }

  network_interface {
    network    = var.network_id
    subnetwork = var.subnet_id
    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    startup-script = "#!/bin/bash\necho 'Template instance started' > /tmp/template.txt"
  }

  tags = ["http-server", "https-server"]

  lifecycle {
    create_before_destroy = true
  }
}

output "instance_template_id" {
  description = "The ID of the created instance template."
  value       = length(google_compute_instance_template.template) > 0 ? google_compute_instance_template.template[0].id : null
}

output "instance_template_self_link" {
  description = "The self link of the created instance template."
  value       = length(google_compute_instance_template.template) > 0 ? google_compute_instance_template.template[0].self_link : null
}
