variable "asset_dir" {}

# Helm Initializer module will install Tiller into your namespace and generate
# TLS assets we are gonna use to authenticate to Tiller
# By default, TLS assets will be created to a directory in
# ${TF_VAR_asset_dir}/${custom_tls_dir:-tiller-namespace}/${helm_dir_name}

variable "tiller_namespace" {
  default = "kube-system"
}

variable "custom_tls_dir" {
  default = "tls"
}

variable "helm_dir_name" {
  default = "helm"
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
variable "tag" {
   type  = "string"
   default ="latest"

}

