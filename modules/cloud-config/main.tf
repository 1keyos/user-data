data "template_file" "user-data" {
  template = "${file("${path.module}/templates/user-data.yml")}"

  vars {
    preformatted-user-data = "${data.template_file.preformatted-user-data.rendered}"
  }
}
resource "tls_private_key" "default" {
  count     = "${var.generate_ssh_key == "true" ? 1 : 0}"
  algorithm = "${var.ssh_key_algorithm}"
}

