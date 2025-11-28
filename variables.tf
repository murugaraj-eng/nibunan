# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Define variables
variable "compartment_ocid" {
  description = "ocid1.compartment.oc1..aaaaaaaa5t75sxcdxlzfydz4ljjz6bwzzrmprpt6re6oshibsyieozxmsosa"
  type        = string
}

variable "subnet_ocid" {
  description = "ocid1.subnet.oc1.ap-hyderabad-1.aaaaaaaapoeq4s2vcdmzrwvan7yv5zciqddojhablzt7et6iizin772dqq5a"
  type        = string
}

variable "image_ocid" {
  description = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaau3h2vfcaa6jwposxo35e7iqxt5wmmbgvdondfm6c2dczep5t2s2q"
  type        = string
}

variable "shape" {
  description = "VM.Standard.E2.1.Micro"
  type        = string
}

variable "display_name" {
  description = "TF-Instance"
  type        = string
  default     = "my-terraform-instance"
}

variable "ssh_public_key" {
  description = "The SSH public key for accessing the instance."
  type        = string
}

