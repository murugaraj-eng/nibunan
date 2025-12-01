variable "tenancy_ocid" {
  description = "OCI tenancy OCID"
  type        = string
  default     = "ocid1.tenancy.oc1..aaaaaaaaztjcu7ullfmozcfqr4ir5xiqwk7hpiagzo4vbknezkbtv6ms63wq"
}

variable "user_ocid" {
  description = "OCI user OCID"
  type        = string
  default     = "ocid1.user.oc1..aaaaaaaaciqxu6k6cfnpzqgjq36eiabotufu7ujzc3cq4popkmlbbqo6yida"
}

variable "fingerprint" {
  description = "API key fingerprint"
  type        = string
  default     = "29:1f:55:58:3b:1c:90:ec:7e:1e:1b:86:51:c6:09:e4"
}

variable "region" {
  description = "OCI region"
  type        = string
  default     = "ap-hyderabad-1"
}

variable "compartment_ocid" {
  description = "OCI compartment OCID"
  type        = string
  default     = "ocid1.tenancy.oc1..aaaaaaaaztjcu7ullfmozcfqr4ir5xiqwk7hpiagzo4vbknezkbtv6ms63wq"
}
variable "private_key" {
  description = "OCI API private key in PEM format"
  type        = string
  sensitive   = true
}
