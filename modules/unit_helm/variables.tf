variable "enabled" {
  default = true
}

variable "count" {
  description = "Default number of masters"
  default     = 1
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
variable "asset_dir" {
  description = "Path to a directory where generated assets should be placed (contains secrets)"
  type        = "string"
}
variable "helm_chart" {
  description = "set helm chart"
  type        = "list"
  default     = ["flannel","calico"]
}





