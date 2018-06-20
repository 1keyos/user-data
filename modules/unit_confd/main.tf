data "template_file" "content" {
  template = "${file("${path.module}/templates/content")}"

  vars = {
   asset_dir  = "${var.asset_dir}"

  }
}


module "unit" {
  source = "../unit"

  name    = "confd"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}
