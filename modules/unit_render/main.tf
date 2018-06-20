data "template_file" "content" {
  template = "${file("${path.module}/templates/content")}"

  vars = {
  }
}
data  "template_file" "bootkubesh" {
  template = "${file("${path.module}/templates/render.sh")}"

  vars = {
   asset_dir  = "${var.asset_dir}"
   IMAGE = "${var.registry}/${var.namespace}/render:${var.tag}"
  }
}

module "unit" {
  source = "../unit"

  name    = "render"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}
