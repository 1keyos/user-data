variable "enabled" {
  default = true
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
variable "etcdip" {
   type  = "string"
}
variable "etcdpeersport" {

   type = "string"
   default = "7001"
}
variable  "etcdport" {
   type = "string"
   default = "4001"
}
variable "asset_dir" {
  description = "Path to a directory where generated assets should be placed (contains secrets)"
  type        = "string"
}
variable "etcd_name" {

 type  = ""
 default = "etcdname"
}
