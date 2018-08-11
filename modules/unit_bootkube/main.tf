data "template_file" "content" {
  template = "${file("${path.module}/templates/content")}"

  vars = {
    asset_dir="${var.asset_dir}"

  }
}
data  "template_file" "bootkubesh" {
  template = "${file("${path.module}/templates/bootkube.sh")}"

  vars = {
    bootkube_image = "${var.registry}/${var.namespace}/kubernetes-bootkube:${var.tag}"
    asset_dir="${var.asset_dir}"
  }
}

module "unit" {
  source = "../unit"

  name    = "bootkube"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}
