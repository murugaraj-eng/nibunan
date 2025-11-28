variable "tenancy_ocid" {
  description = "OCI tenancy OCID"
  type        = string
  default     = "ocid1.tenancy.oc1..aaaaaaaaztjcu7ullfmozcfqr4ir5xiqwk7hpiagzo4vbknezkbtv6ms63wq"
}

variable "user_ocid" {
  description = "OCI user OCID"
  type        = string
  default     = "ocid1.user.oc1..aaaaaaaanjnckzglk2fjel3uq7em4rpiz4ttufox7ss33x32isjkm6kz6ltq"
}

variable "fingerprint" {
  description = "API key fingerprint"
  type        = string
  default     = "8b:47:fd:3c:11:94:fe:84:09:75:09:34:47:1c:dd:aa"
}

variable "region" {
  description = "OCI region"
  type        = string
  default     = "ap-hyderabad-1"
}

variable "compartment_ocid" {
  description = "OCI compartment OCID"
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaa5t75sxcdxlzfydz4ljjz6bwzzrmprpt6re6oshibsyieozxmsosa"
}
variable "private_key" {
  description = "OCI API private key in PEM format"
  type        = string
  sensitive   = true
}
