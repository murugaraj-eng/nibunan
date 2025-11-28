# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Configure the OCI Provider
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key_path = var.private_key_path
  fingerprint      = var.fingerprint
  region           = var.region
}


# Create the OCI Compute Instance
resource "oci_core_instance" "my_instance" {
  compartment_id        = var.compartment_ocid
  availability_domain   = data.oci_identity_availability_domains.ads.availability_domains[0].name # Or specify a specific AD
  shape                 = var.shape
  display_name          = var.display_name

  source_details {
    source_type = "image"
    image_id    = var.image_ocid
  }

  create_vnic_details {
    subnet_id        = var.subnet_ocid
    assign_public_ip = true # Set to false if you don't need a public IP
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}

# Data source to retrieve Availability Domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

# Output the public IP address of the instance
output "instance_public_ip" {
  value = oci_core_instance.my_instance.public_ip
}
