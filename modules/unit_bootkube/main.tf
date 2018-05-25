data "template_file" "content" {
  template = "${file("${path.module}/templates/content")}"

  vars = {
  }
}
data  "template_file" "bootkubesh" {
  template = "${file("${path.module}/templates/bootkube.sh")}"

  vars = {
    bootkube_image = "${var.registry}/${var.namespace}/kubernetes-bootkube:${var.tag}"
  }
}

module "unit" {
  source = "../unit"

  name    = "bootkube"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}
