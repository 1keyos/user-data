data "template_file" "coreos" {
  template = "${file("${path.module}/templates/coreos.yml")}"

  vars {
  # etcd2     = "${replace(replace("${module._etcd2.data["enabled"]}", "/^(true|1)$/", data.template_file.etcd2.rendered), "/^${module._etcd2.data["enabled"]}$/", "")}"
    flannel   = "${replace(replace("${module._flannel.data["enabled"]}", "/^(true|1)$/", data.template_file.flannel.rendered), "/^${module._flannel.data["enabled"]}$/", "")}"
    locksmith = "${replace(replace("${module._locksmith.data["enabled"]}", "/^(true|1)$/", data.template_file.locksmith.rendered), "/^${module._locksmith.data["enabled"]}$/", "")}"
    update    = "${data.template_file.update.rendered}"
    units     = "${data.template_file.units.rendered}"
  }
}
