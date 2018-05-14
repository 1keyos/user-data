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
  default     = "node-role.kubernetes.io/master=:NoSchedule"
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
