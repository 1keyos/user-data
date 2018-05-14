variable "flannel" {
  type    = "map"
  default = {}
}

module "_flannel" {
  source = "./submodules/flannel"
  vars   = "${var.flannel}"
}

output "enable_flannel" {
  value = "${module._flannel.data["enabled"]}"
}

output "flannel_public-ip" {
  value = "${module._flannel.data["public-ip"]}"
}

output "flannel_etcd-endpoints" {
  value = "${module._flannel.data["etcd-endpoints"]}"
}

output "flannel_etcd-prefix" {
  value = "${module._flannel.data["etcd-prefix"]}"
}

output "flannel_etcd-keyfile" {
  value = "${module._flannel.data["etcd-keyfile"]}"
}

output "flannel_etcd-certfile" {
  value = "${module._flannel.data["etcd-certfile"]}"
}

output "flannel_etcd-cafile" {
  value = "${module._flannel.data["etcd-cafile"]}"
}

output "flannel_interface" {
  value = "${module._flannel.data["interface"]}"
}

output "flannel_subnet-file" {
  value = "${module._flannel.data["subnet-file"]}"
}

output "flannel_ip-masq" {
  value = "${module._flannel.data["ip-masq"]}"
}

output "flannel_config" {
  value = "${module._flannel.data["config"]}"
}

data "template_file" "flannel_config" {
  template = "${file("${path.module}/templates/flannel-config.yml")}"

  vars {
    public-ip       = "${module._flannel.data["public-ip"]}"
    etcd-endpoints  = "${module._flannel.data["etcd-endpoints"]}"
    etcd-prefix     = "${module._flannel.data["etcd-prefix"]}"
    key-file        = "${module._flannel.data["etcd-keyfile"]}"
    cert-file       = "${module._flannel.data["etcd-certfile"]}"
    trusted-ca-file = "${module._flannel.data["etcd-cafile"]}"
    interface       = "${module._flannel.data["interface"]}"
    subnet-file     = "${module._flannel.data["subnet-file"]}"
    ip-masq         = "${module._flannel.data["ip-masq"]}"

    config = "${replace(module._flannel.data["config"], "/(\n)/", "")}"
  }
}

module "flannel_unit" {
  source = "../unit"

  name     = "flanneld"
  enabled  = "${module._flannel.data["enabled"]}"
  drop-ins = "${data.template_file.flannel_config.rendered}"
}

data "template_file" "flannel" {
  template = "${file("${path.module}/templates/flannel.yml")}"

  vars {
    etcd-endpoints = "${module._flannel.data["etcd-endpoints"]}"
    etcd-cafile    = "${module._flannel.data["etcd-cafile"]}"
    etcd-certfile  = "${module._flannel.data["etcd-certfile"]}"
    etcd-keyfile   = "${module._flannel.data["etcd-keyfile"]}"
  }
}
