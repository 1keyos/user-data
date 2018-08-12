variable "cluster_name" {
  description = "Cluster name"
  type        = "string"
}

variable "api_servers" {
  description = "List of URLs used to reach kube-apiserver"
  type        = "list"
}
variable "api_port" {
  description = "api port"
  type        = "string"
  default     = "6433"
}


variable "ha_kube_ip" {
  description = "ha kube-apiserver"
  type        = "string"
}

variable "etcd_servers" {
  description = "List of URLs used to reach etcd servers."
  type        = "list"
}

variable "asset_dir" {
  description = "Path to a directory where generated assets should be placed (contains secrets)"
  type        = "string"
}

variable "cloud_provider" {
  description = "The provider for cloud services (empty string for no provider)"
  type        = "string"
  default     = ""
}

variable "networking" {
  description = "Choice of networking provider (flannel or calico)"
  type        = "list"
  default     = ["flannel","calico"]
}

variable "network_mtu" {
  description = "CNI interface MTU (applies to calico only)"
  type        = "string"
  default     = "1500"
}

variable "network_ip_autodetection_method" {
  description = "Method to autodetect the host IPv4 address (applies to calico only)"
  type        = "string"
  default     = "first-found"
}

variable "pod_cidr" {
  description = "CIDR IP range to assign Kubernetes pods"
  type        = "string"
  default     = "10.2.0.0/16"
}

variable "service_cidr" {
  description = <<EOD
CIDR IP range to assign Kubernetes services.
The 1st IP will be reserved for kube_apiserver, the 10th IP will be reserved for kube-dns.
EOD

  type    = "string"
  default = "10.3.0.0/24"
}

variable "cluster_domain_suffix" {
  description = "Queries for domains with the suffix will be answered by kube-dns"
  type        = "string"
  default     = "cluster.local"
}


variable "trusted_certs_dir" {
  description = "Path to the directory on cluster nodes where trust TLS certs are kept"
  type        = "string"
  default     = "/usr/share/ca-certificates"
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
variable "registry" {
   type = "string"
   default     = "117.25.155.104:5000"

}
variable "namespace" {
   type  = "string"
   default = "port"  
}
variable "kube_system" {
   type  = "string"
   default = "kube-system"
}
variable "endpoints" {
   type  = "string"
   default = "https://111.111.11.11"
}
variable "tag" {
   type  = "string"
   default ="latest"

}
variable "token_id" {
   type = "string"
   default = "pwn3in"
}

variable "token_secret" {
   type = "string"
   default = "mar0oyzuvjwl3fno"
}
variable  "ca_cert"   {
  type        = "string"
  default     = ""
}
variable  "apiserver_key" {
  type        = "string"
  default     = ""
}
variable  "apiserver_cert"  {
  type        = "string"
  default     = ""
}
variable   "serviceaccount_pub" {
  type        = "string"
  default     = ""
}
variable   "serviceaccount_key" {
  type        = "string"
  default     = ""
}

variable    "etcd_ca_cert" {
  type        = "string"
  default     = ""
}
variable   "etcd_client_cert" {
  type        = "string"
  default     = ""
}
variable   "etcd_client_key" {
  type        = "string"
  default     = ""
}
variable "ip_etcd_servers" {
  description = "List of URLs used to reach etcd servers."
  type        = "list"
}
variable  "etcdport" {
   type = "string"
   default = "4001"
}
variable "IPV4" {
  default     = "true"
}
variable "IPV6" {
  default  = "true"
}
variable "ipv6_pod_cidr" {
  type = "string"
  default = "fd20::0/112"
}


