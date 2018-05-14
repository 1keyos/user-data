variable "etcd_ca_cert" {
  description = "SSL Certificate Authority file used to secure etcd communication"
}

variable "etcd_client_key" {
  description = "SSL key file used to secure etcd communication"
}

variable "etcd_client_cert" {
  description = "etcd client certificate"
}

variable "count" {
  description = "Default number of masters"
  default     = 1
}

variable "discovery-srv" {
  description = "Domain name used for etcd discovery"
}

variable "organization" {
  description = "Organisation name"
}
variable "ssh_key_algorithm" {
  default = "RSA"
}
variable "public_key" {
  description = "SSH Public Key"
}
variable "generate_ssh_key" {
  default = "true"
}
variable "reboot_strategy" {
  description = "CoreOS reboot strategy"
  default     = "best-effort"
}

variable "additional_units" {
  type    = "list"
  default = []
}

variable "k8s-domain" {
  description = "Domain name used for kubernetes cluster"
  default     = "k8s.cluster"
}

variable "internal_api_hostname" {
  description = "The internal resolved hostname of the elb"
  default     = "api"
}
variable "out_dir" {
  description = "Path to a directory where generated assets should be placed (contains secrets)"
  type        = "string"
}

variable "cloud-provider" {}
variable "cluster_name" {
  description = "Cluster name"
  type        = "string"
}

variable "vpc_cidr" {
  description = "VPC cidr"
}
