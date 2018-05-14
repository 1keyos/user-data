variable "locksmith" {
  type    = "map"
  default = {}
}

module "_locksmith" {
  source = "./submodules/locksmith"
  vars   = "${var.locksmith}"
}

output "enable_locksmith" {
  value = "${module._locksmith.data["enabled"]}"
}

output "locksmith_reboot-strategy" {
  value = "${module._locksmith.data["reboot-strategy"]}"
}

output "locksmith_endpoint" {
  value = "${module._locksmith.data["endpoint"]}"
}

output "locksmith_etcd-keyfile" {
  value = "${module._locksmith.data["etcd-keyfile"]}"
}

output "locksmith_etcd-certfile" {
  value = "${module._locksmith.data["etcd-certfile"]}"
}

output "locksmith_group" {
  value = "${module._locksmith.data["group"]}"
}

data "template_file" "locksmith" {
  template = "${file("${path.module}/templates/locksmith.yml")}"

  vars {
    endpoint      = "${module._locksmith.data["endpoint"]}"
    etcd-cafile   = "${module._locksmith.data["etcd-cafile"]}"
    etcd-certfile = "${module._locksmith.data["etcd-certfile"]}"
    etcd-keyfile  = "${module._locksmith.data["etcd-keyfile"]}"
    group         = "${module._locksmith.data["group"]}"
    window-start  = "${module._locksmith.data["window-start"]}"
    window-length = "${module._locksmith.data["window-length"]}"
    etcd-username = "${module._locksmith.data["etcd-username"]}"
    etcd-password = "${module._locksmith.data["etcd-password"]}"
  }
}
