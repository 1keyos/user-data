data "template_file" "content" {
  template = "${file("${path.module}/templates/content")}"

  vars = {
   asset_dir  = "${var.asset_dir}"

  }
}
data  "template_file" "helmsh" {
  template = "${file("${path.module}/templates/helm.sh")}"

  vars = {
   asset_dir  = "${var.asset_dir}"
   IMAGE = "${var.registry}/${var.namespace}/helm:${var.tag}"
  }
}

module "unit" {
  source = "../unit"

  name    = "helm"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}
