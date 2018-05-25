data "template_file" "content" {
  template = "${file("${path.module}/templates/content")}"

  vars = {
  }
}
data  "template_file" "etcdstart" {
  template = "${file("${path.module}/templates/etcd-start")}"

  vars = {
    etcd_image = "${var.registry}/${var.namespace}/etcd:${var.tag}"
  }
}

module "unit" {
  source = "../unit"

  name    = "etcd"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}
