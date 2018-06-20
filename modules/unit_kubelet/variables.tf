variable "enabled" {
  default = true
}

variable "k8s-version" {
  description = "Kubernetes version"
  default     = "1.4.6"
}

variable "k8s-aci" {
  description = "Kubernetes ACI"
  default     = "quay.io/coreos/hyperkube"
}

variable "cluster-domain" {}
variable "kubelet_cni_bin_dir" {
  type = "string"
  default = "/var/lib/cni/bin"
}

variable "kube_dns_service_ip" {
  type        = "string"
  description = "Service IP used to reach kube-dns"
  default     = "10.3.0.10"
}

variable "kubelet_node_label" {
  type        = "string"
  description = "Label that Kubelet will apply on the node"
  default     = "node-role.kubernetes.io/master"
}

variable "kubelet_node_taints" {
  type        = "string"
  description = "(optional) Taints that Kubelet will apply on the node"
  default     = ""
}

variable "kubeconfig_fetch_cmd" {
  type        = "string"
  description = "(optional) The command that fetches `/etc/kubernetes/kubeconfig`."
  default     = ""
}

variable "cloud_provider" {
  type        = "string"
  description = "(optional) The cloud provider to be used for the kubelet."
  default     = ""
}

variable "cloud_provider_config" {
  type        = "string"
  description = "(optional) The cloud provider config to be used for the kubelet."
  default     = "--cloud-config=/etc/kubernetes/cloud/config"
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

variable "api_port" {
   type = "string"
   default = "6443"

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
variable "api_servers" {
  description = "List of URLs used to reach kube-apiserver"
  type        = "list"
}
variable "cluster_domain_suffix" {
  description = "Queries for domains with the suffix will be answered by kube-dns"
  type        = "string"
  default     = "cluster.local"
}
variable "service_cidr" {
  description = <<EOD
CIDR IP range to assign Kubernetes services.
The 1st IP will be reserved for kube_apiserver, the 10th IP will be reserved for kube-dns.
EOD

  type    = "string"
  default = "10.3.0.0/24"
}
