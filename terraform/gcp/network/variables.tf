# jq -c . /path/to/gce-creds.json
variable "credentials_json" {
  type = string
  description = "Contents of a GCP JSON credentials file"
}

variable "project" {
  type = string
  description = "GCP project ID"
}

variable "zone" {
  type = string
  description = "Zone to launch servers in"
}

variable "prefix" {
  type = string
  description = "Resource name prefix"
  default = "cfy"
}
