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
variable "registry" {
   type = "string"
   default     = "117.25.155.104:5000"

}
variable "namespace" {
   type  = "string"
   default = "port"  
}
variable "tag" {
   type  = "string"
   default ="latest"

}
variable "etcd_servers" {
  description = "List of URLs used to reach etcd servers."
  type        = "list"
}
variable "ip_etcd_servers" {
  description = "List of URLs used to reach etcd servers."
  type        = "list"
}

variable "discovery_ip" {
   description = "discovery_ip add"
   type  = "string"
   default = "172.100.0.8"

}
variable "etcdpeersport" {

   type = "string"
   default = "7001"
}
variable  "etcdport" {
   type = "string"
   default = "4001"
}
variable "ha_kube_ip" {
  description = "ha kube-apiserver"
  type        = "string"
}
variable "ca_certificate" {
  description = "Existing PEM-encoded CA certificate (generated if blank)"
  type        = "string"
  default     = ""
}

variable "ca_key_alg" {
  description = "Algorithm used to generate ca_key (required if ca_cert is specified)"
  type        = "string"
  default     = "RSA"
}

variable "ca_private_key" {
  description = "Existing Certificate Authority private key (required if ca_certificate is set)"
  type        = "string"
  default     = ""
}
variable "asset_dir" {
  description = "Path to a directory where generated assets should be placed (contains secrets)"
  type        = "string"
}
variable "api_servers" {
  description = "List of URLs used to reach kube-apiserver"
  type        = "list"
}


