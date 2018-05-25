output "data" {
  value = {
    enabled       = "${lookup(var.vars, "enabled", var.enabled)}"
    endpoint      = "${lookup(var.vars, "endpoint", var.endpoint)}"
    reboot-strategy = "${var.reboot-strategy}"
    etcd-cafile   = "${lookup(var.vars, "etcd-cafile", var.etcd-cafile)}"
    etcd-certfile = "${lookup(var.vars, "etcd-certfile", var.etcd-certfile)}"
    etcd-keyfile  = "${lookup(var.vars, "etcd-keyfile", var.etcd-keyfile)}"
    group         = "${lookup(var.vars, "group", var.group)}"
    window-start  = "${lookup(var.vars, "window-start", var.window-start)}"
    window-length = "${lookup(var.vars, "window-length", var.window-length)}"
    etcd-username = "${lookup(var.vars, "etcd-username", var.etcd-username)}"
    etcd-password = "${lookup(var.vars, "etcd-password", var.etcd-password)}"
  }
}
