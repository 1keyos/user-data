data "template_file" "content" {
  template = "${file("${path.module}/templates/content")}"

  vars = {
  }
}

module "unit" {
  source = "../unit"

  name    = "bootkube"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}
