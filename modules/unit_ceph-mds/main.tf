data "template_file" "content" {
  template = "${file("${path.module}/templates/content")}"

  vars = {
   registry="${var.registry}"
   namespace="${var.namespace}"
   tag="${var.tag}"
  }
}
module "unit" {
  source = "../unit"

  name    = "ceph-mds"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}

