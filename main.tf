provider "oci" {
  tenancy_ocid        = var.tenancy_ocid
  user_ocid           = var.user_ocid
  fingerprint         = var.fingerprint
  private_key         = var.private_key
  region              = var.region
}

# Create a Virtual Cloud Network (VCN)
resource "oci_core_vcn" "example_vcn" {
  cidr_block     = "10.10.0.0/16"
  display_name   = "example-vcn"
  compartment_id = var.compartment_ocid
}

# Create a Subnet
resource "oci_core_subnet" "example_subnet" {
  cidr_block        = "10.10.4.0/24"
  display_name      = "example-subnet"
  vcn_id            = oci_core_vcn.example_vcn.id
  compartment_id    = var.compartment_ocid
  prohibit_public_ip_on_vnic = false
}

# Create an Internet Gateway
resource "oci_core_internet_gateway" "example_igw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.example_vcn.id
  display_name   = "example-igw"
}

# Route Table
resource "oci_core_route_table" "example_rt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.example_vcn.id
  display_name   = "example-rt"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.example_igw.id
  }
}

# Update Subnet with Route Table
resource "oci_core_subnet" "example_subnet_with_rt" {
  cidr_block        = "10.10.4.0/24"
  display_name      = "example-subnet"
  vcn_id            = oci_core_vcn.example_vcn.id
  compartment_id    = var.compartment_ocid
  route_table_id    = oci_core_route_table.example_rt.id
  prohibit_public_ip_on_vnic = false
}

# Create Compute Instance
resource "oci_core_instance" "example_instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  display_name        = "example-instance"
  shape               = "VM.Standard.E2.1"

  create_vnic_details {
    subnet_id        = oci_core_subnet.example_subnet_with_rt.id
    assign_public_ip = true
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux.images[0].id
  }

#  metadata = {
 #   ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
#  }
}

# Get Availability Domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

# Get Oracle Linux Image
data "oci_core_images" "oracle_linux" {
  compartment_id = var.compartment_ocid
  operating_system = "Oracle Linux"
  operating_system_version = "8"
}
