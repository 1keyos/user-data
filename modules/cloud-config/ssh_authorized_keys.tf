variable "ssh_authorized_keys" {
  type    = "list"
  default = []
}

data "template_file" "ssh_authorized_keys" {
  template = "${length(var.ssh_authorized_keys) == "0" ?  "" : data.template_file._ssh_authorized_keys.rendered}"
}

data "template_file" "_ssh_authorized_keys" {
  template = "${file("${path.module}/templates/ssh_authorized_keys.yml")}"

  vars {
    ssh_authorized_keys = "${join("\n", var.ssh_authorized_keys)}"
  }
}
