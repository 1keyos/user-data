output "data" {
  value = {
    enabled        = "${lookup(var.vars, "enabled", var.enabled)}"
    public-ip      = "${lookup(var.vars, "public-ip", var.public-ip)}"
    etcd-endpoints = "${lookup(var.vars, "etcd-endpoints", var.etcd-endpoints)}"
    etcd-prefix    = "${lookup(var.vars, "etcd-prefix", var.etcd-prefix)}"
    etcd-keyfile   = "${lookup(var.vars, "etcd-keyfile", var.etcd-keyfile)}"
    etcd-certfile  = "${lookup(var.vars, "etcd-certfile", var.etcd-certfile)}"
    etcd-cafile    = "${lookup(var.vars, "etcd-cafile", var.etcd-cafile)}"
    interface      = "${lookup(var.vars, "interface", var.interface)}"
    subnet-file    = "${lookup(var.vars, "subnet-file", var.subnet-file)}"
    ip-masq        = "${lookup(var.vars, "ip-masq", var.ip-masq)}"
    config         = "${lookup(var.vars, "config", var.config)}"
  }
}
